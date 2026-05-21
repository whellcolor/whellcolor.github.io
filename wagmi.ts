const bbtestnet = {
        id: 20677,
        name: "global-wolverine-ff979075",
        network: "bbtestnet",
        nativeCurrency: {
          decimals: 18,
          name: "Native Token",
          symbol: "Native Token",
        },
        rpcUrls: {
          public: { http: ["https://rpc.buildbear.io/global-wolverine-ff979075"] },
          default: { http: ["https://rpc.buildbear.io/global-wolverine-ff979075"] },
        },
        blockExplorers: {
          etherscan: {
            name: "BBExplorer",
            url: "https://explorer.buildbear.io/global-wolverine-ff979075",
          },
          default: {
            name: "BBExplorer",
            url: "https://explorer.buildbear.io/global-wolverine-ff979075",
          },
        },
      } as const satisfies Chain;
      
  const { chains, publicClient, webSocketPublicClient } = configureChains(
        [bbtestnet],
        [
          jsonRpcProvider({
            rpc: (chain) => ({
              http: "https://rpc.buildbear.io/global-wolverine-ff979075",
            }),
          }),
        ]
      );
