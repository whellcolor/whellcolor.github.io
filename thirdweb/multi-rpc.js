import { ethers } from "ethers";

export const RPCS = {
  ethereum: {
    mainnet: "https://rpc.ankr.com/eth",
    sepolia: "https://rpc.ankr.com/eth_sepolia",
  },

  base: {
    mainnet: "https://mainnet.base.org",
    sepolia: "https://sepolia.base.org",
  },

  polygon: {
    mainnet: "https://polygon-rpc.com",
    amoy: "https://rpc-amoy.polygon.technology",
  },

  bsc: {
    mainnet: "https://bsc-dataseed.binance.org",
  },

  arbitrum: {
    sepolia: "https://sepolia-rollup.arbitrum.io/rpc",
  },
};

// provider helper
export function getProvider(chain, network) {
  return new ethers.JsonRpcProvider(RPCS[chain][network]);
}

// optional: test RPC health
export async function checkRpc(rpcUrl) {
  try {
    const provider = new ethers.JsonRpcProvider(rpcUrl);
    await provider.getBlockNumber();
    return true;
  } catch {
    return false;
  }
}
