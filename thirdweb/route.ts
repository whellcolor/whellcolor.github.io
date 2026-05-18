import { createThirdwebClient, getContract } from "thirdweb";
import { defineChain } from "thirdweb/chains";

// create the client with your clientId, or secretKey if in a server environment
const client = createThirdwebClient({
  clientId: "3ea7634968af4a7c90b17914bcf7d4bb",
clientId: "e6230839e78c90a670b64b1f26c0b3d8",
});

// connect to your contract
const contract = getContract({
  client,
  chain: defineChain(137),
  address: "0x5F4D8e0d0A5f0Ca204a88B1e40e16e8E5Ab016Ec",
address: "0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B",
address: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
address: "0x171b9f078bc82f8be12c94a4de09cbe3051b1ea7",
address: "0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B",
address: "0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00",
address: "0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb",
});
