const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const axios = require('axios');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Configuration settings (easily adjustable here or via environment variables)
const REWARD_AMOUNT = process.env.REWARD_AMOUNT || 10; // in satoshi / smallest unit
const COOLDOWN_MINUTES = parseInt(process.env.COOLDOWN_MINUTES || '60', 10);
const PAYOUT_CURRENCY = 'BTC';

// In-memory stores for demonstration (use a database like PostgreSQL/MongoDB in production)
const claimHistory = [];
const userCooldowns = new Map(); // Key: address/IP, Value: timestamp of last claim

// Helper: Check API key presence
if (!process.env.FAUCETPAY_API_KEY) {
    console.warn("WARNING: FAUCETPAY_API_KEY environment variable is not set!");
}

// Endpoint: Fetch supported currencies dynamically from FaucetPay
app.get('/api/currencies', async (req, res) => {
    try {
        const response = await axios.get('https://faucetpay.io/api/v1/currencies');
        res.json(response.data);
    } catch (error) {
        res.json({ status: 200, message: "Success", currencies: ["BTC", "ETH", "DOGE", "LTC"] });
    }
});

// Endpoint: Handle Claim Requests
app.post('/api/claim', async (req, res) => {
    const { address } = req.body;
    const clientIp = req.headers['x-forwarded-for'] || req.socket.remoteAddress;

    if (!address) {
        return res.status(400).json({ success: false, message: "Please provide a valid FaucetPay address or username." });
    }

    // 1. Cooldown & Anti-Abuse Check
    const now = Date.now();
    const lastClaimTime = userCooldowns.get(address) || userCooldowns.get(clientIp);
    const cooldownMs = COOLDOWN_MINUTES * 60 * 1000;

    if (lastClaimTime && (now - lastClaimTime < cooldownMs)) {
        const remainingMins = Math.ceil((cooldownMs - (now - lastClaimTime)) / 60000);
        return res.status(429).json({ 
            success: false, 
            message: `Cooldown active. Please wait ${remainingMins} more minutes before claiming again.` 
        });
    }

    try {
        // 2. Server-side payout call to FaucetPay API v1/v2
        const payoutResponse = await axios.post('https://faucetpay.io/api/v1/send', {
            api_key: process.env.FAUCETPAY_API_KEY, // Kept strictly on the server
            to: address,
            amount: REWARD_AMOUNT,
            currency: PAYOUT_CURRENCY,
            ip_address: clientIp
        });

        if (payoutResponse.data && payoutResponse.data.status === 200) {
            // Update cooldown timer on success
            userCooldowns.set(address, now);
            userCooldowns.set(clientIp, now);

            // Log claim history
            claimHistory.unshift({
                address,
                amount: REWARD_AMOUNT,
                currency: PAYOUT_CURRENCY,
                time: new Date().toISOString(),
                ip: clientIp,
                status: 'Success'
            });

            return res.json({ 
                success: true, 
                message: `Successfully sent ${REWARD_AMOUNT} satoshi to your FaucetPay account!` 
            });
        } else {
            return res.status(400).json({ 
                success: false, 
                message: payoutResponse.data.message || "Payout failed. Please verify your address." 
            });
        }
    } catch (error) {
        console.error("Payout API Error:", error.response?.data || error.message);
        return res.status(500).json({ 
            success: false, 
            message: "Server error processing payout. Please try again later." 
        });
    }
});

// Endpoint: Admin Claim Logs
app.get('/api/logs', (req, res) => {
    res.json(claimHistory.slice(0, 20)); // Return last 20 claims
});

app.listen(PORT, () => {
    console.log(`WCC Faucet server running on port ${PORT}`);
});
