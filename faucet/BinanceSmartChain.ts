import { TatumSDK, Network, BinanceSmartChain } from '@tatumio/tatum'

const tatum = await TatumSDK.init<BinanceSmartChain>({network: Network.BINANCE_SMART_CHAIN})

const balance = await tatum.rpc.getBalance
('0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B')
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
