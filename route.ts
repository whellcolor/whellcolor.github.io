import { createThirdwebClient } from "thirdweb";
import { facilitator, settlePayment } from "thirdweb/x402";
import { arbitrumSepolia } from "thirdweb/chains";

const client = createThirdwebClient({ secretKey: "G8vNXJOMTp_TuTQV3kgFIQyKAz_L21F3a9SW57zKanPEqK7iGCHyTUcHKuujJR1q3G2h7d4VHaIlDeR3yn0Wjw" });

const thirdwebX402Facilitator = facilitator({
  client,
  serverWalletAddress: "0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B",
});

export async function GET(request: Request) {
  // process the payment
  const result = await settlePayment({
    resourceUrl: "https://api.example.com/premium-content",
    method: "GET",
    paymentData: request.headers.get("x-payment"),
    network: arbitrumSepolia,
    price: "$0.01",
    facilitator: thirdwebX402Facilitator,
  });

  if (result.status === 200) {
    // Payment successful, continue to app logic
    return Response.json({ data: "premium content" });
  } else {
    return Response.json(result.responseBody, {
      status: result.status,
      headers: result.responseHeaders,
    });
  }
}
