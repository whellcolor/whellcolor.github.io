const express = require('express');
const TronWeb = require('tronweb');
const rateLimit = require('express-rate-limit');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(express.static('public'));

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: 'PRIVATE_KEY_FAUCET'
});

// limit 1 request / 24 jam per IP
const faucetLimiter = rateLimit({
  windowMs: 24 * 60 * 60 * 1000,
  max: 1,
  message: {
    error: 'Sudah claim hari ini'
  }
});

app.post('/claim', faucetLimiter, async (req, res) => {
  try {
    const { address } = req.body;

    if (!tronWeb.isAddress(address)) {
      return res.status(400).json({
        error: 'Alamat TRON tidak valid'
      });
    }

    // 1 TRX
    const amount = 1_000_000;

    const tx = await tronWeb.trx.sendTransaction(
      address,
      amount
    );

    res.json({
      success: true,
      txid: tx.txid
    });

  } catch (e) {
    res.status(500).json({
      error: e.message
    });
  }
});

app.listen(3000, () => {
  console.log('Faucet running on port 3000');
});
