// app/api/premium-content/route.ts
import { settlePayment, facilitator } from "thirdweb/x402";
import { createThirdwebClient } from "thirdweb";
import { arbitrumSepolia } from "thirdweb/chains";

const client = createThirdwebClient({
  secretKey: process.env.THIRDWEB_SECRET_KEY,
});

const thirdwebFacilitator = facilitator({
  client,
  serverWalletAddress: "0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B",
});

export async function GET(request: Request) {
  const paymentData =
    request.headers.get("PAYMENT-SIGNATURE") ||
    request.headers.get("X-PAYMENT");

  // Verify and process the payment
  const result = await settlePayment({
    resourceUrl: "https://api.example.com/premium-content",
    method: "GET",
    paymentData,
    payTo: "0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B",
    network: arbitrumSepolia,
    price: "$0.10", // or { amount: "100000", asset: { address: "0x...", decimals: 6 } }
    facilitator: thirdwebFacilitator,
    routeConfig: {
      description: "Access to premium API content",
      mimeType: "application/json",
      maxTimeoutSeconds: 60 * 60, // 1 hour signature expiration
    },
  });

  if (result.status === 200) {
    // Payment verified and settled successfully
    return Response.json({ data: "premium content" });
  } else {
    // Payment required
    return Response.json(result.responseBody, {
      status: result.status,
      headers: result.responseHeaders,
    });
  }
}
