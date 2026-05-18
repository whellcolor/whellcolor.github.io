import { serverWallet } from "./serverWallet";
import { mintNFT } from "./mint";

export async function queueMint() {
  const transaction = await mintNFT();

  const result = await serverWallet.enqueueTransaction({
    transaction,
  });

  console.log("Queued TX ID:", result.transactionId);
  return result;
}
