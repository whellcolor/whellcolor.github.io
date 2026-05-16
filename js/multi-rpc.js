// multi-rpc.js
import { ethers } from "ethers";

const RPCS = {
  ethereum: {
    mainnet: "https://mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    sepolia: "https://sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    mainnet: "https://rpc.buildbear.io/global-wolverine-ff979075",
    sepolia: "https://rpc.buildbear.io/global-wolverine-ff979075",
    mainnet: "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
    sepolia:  "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
  },

  linea: {
    mainnet: "https://linea-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    sepolia: "https://linea-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  polygon: {
    mainnet: "https://polygon-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    amoy: "https://polygon-amoy.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    mainnet: "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
    sepolia:  "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",

  },

  base: {
    sepolia: "https://base-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    mainnet: "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
    sepolia:  "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",

  },

  arbitrum: {
    sepolia: "https://arbitrum-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    mainnet: "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
    sepolia:  "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",

  },

  optimism: {
    mainnet: "https://optimism-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  avalanche: {
    fuji: "https://avalanche-fuji.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  bsc: {
    mainnet: "https://bsc-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    mainnet: "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",
    sepolia:  "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb",

  
  },

  mantle: {
    mainnet: "https://mantle-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  opbnb: {
    mainnet: "https://opbnb-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  scroll: {
    sepolia: "https://scroll-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  celo: {
    sepolia: "https://celo-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  blast: {
    sepolia: "https://blast-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  monad: {
    testnet: "https://monad-testnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },

  unichain: {
    mainnet: "https://unichain-mainnet.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
    sepolia: "https://unichain-sepolia.infura.io/v3/418d1e12e6e4490fa5ed80a4b3b8ae8a",
  },
};

// ambil provider
export function getProvider(chain, network) {
  return new ethers.JsonRpcProvider(
    RPCS[chain][network]
  );
}

// contoh cek block terbaru
async function checkBlock() {
  const provider = getProvider("ethereum", "sepolia");

  const block = await provider.getBlockNumber();

  console.log("Latest Block:", block);
}

checkBlock();
