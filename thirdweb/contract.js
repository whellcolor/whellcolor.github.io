import { getContract } from "thirdweb";
import { defineChain } from "thirdweb/chains";

export const chainId = 84532; // Base Sepolia

export const contract = getContract({
  address: "0x8a4E14591088bBce4a4Dcfa677C1af78d336d6FB",
  chain: defineChain(chainId),
  client: process.env.THIRDWEB_CLIENT, // jangan pakai hex
});
