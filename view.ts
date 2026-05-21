import { createPublicClient, defineChain, http } from "viem";

const buildbearRpcUrl =
  "https://rpc.buildbear.io/global-wolverine-ff979075";

const buildBearNetwork = defineChain({
  id: [31337],
  name: "BuildBear Sandbox Network",
  nativeCurrency: {
    name: "BBETH",
    decimals: 18,
    symbol: "BBETH",
  },
  rpcUrls: {
    default: {
      http: [buildbearRpcUrl],
    },
  },
  blockExplorers: {
    default: {
      name: "BuildBear Explorer",
      url: "https://explorer.buildbear.io/global-wolverine-ff979075",
    },
  },
});

const publicClient = createPublicClient({
  chain: buildBearNetwork,
  transport: http(buildbearRpcUrl),
});
