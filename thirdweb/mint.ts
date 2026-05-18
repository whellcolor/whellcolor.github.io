import { mintTo } from "thirdweb/extensions/erc721";
import { contract } from "./contract";

export async function mintNFT() {
  const tx = await mintTo({
    contract,
    to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
    nft: {
      name: "Whellcolor Cube Crypto (WCC)",
      description:
        "NFT Web3-powered crypto ecosystem built on Ethereum with wallet connect, staking, and on-chain utilities.",
      image: "https://whellcolor.github.io/nft/0.png",
    },
  });

  console.log("Mint success:", tx);
  return tx;
}
