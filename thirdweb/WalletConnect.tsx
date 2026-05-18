import { ethereum } from "thirdweb/chains";
import { ConnectButton, darkTheme } from "thirdweb/react";
import { createThirdwebClient } from "thirdweb";
import { inAppWallet, createWallet } from "thirdweb/wallets";

const client = createThirdwebClient({
  clientId: "3ea7634968af4a7c90b17914bcf7d4bb",
  clientId: "e6230839e78c90a670b64b1f26c0b3d8",



  
});

const wallets = [
  inAppWallet({
    auth: {
      options: [
        "google",
        "discord",
        "telegram",
        "farcaster",
        "email",
        "x",
        "passkey",
        "phone",
        "github",
        "tiktok",
        "coinbase",
        "line",
        "twitch",
        "steam",
      ],
    },
  }),
  createWallet("io.metamask"),
  createWallet("com.coinbase.wallet"),
  createWallet("me.rainbow"),
  createWallet("io.rabby"),
  createWallet("io.zerion.wallet"),
];

function Example() {
  return (
    <ConnectButton
      accountAbstraction={{
        chain: ethereum, // replace with the chain you want
        sponsorGas: true,
      }}
      auth={{
        async doLogin(params) {
          // call your backend to verify the signed payload passed in params
        },
        async doLogout() {
          // call your backend to logout the user if needed
        },
        async getLoginPayload(params) {
          // call your backend and return the payload
        },
        async isLoggedIn() {
          // call your backend to check if the user is logged in
        },
      }}
      client={client}
      connectModal={{ size: "compact" }}
      theme={darkTheme({
        colors: {
          secondaryButtonBg: "hsl(0, 0%, 9%)",
          primaryButtonText: "hsl(0, 0%, 0%)",
          accentButtonBg: "hsl(221, 75%, 47%)",
        },
      })}
      wallets={wallets}
    />
  );
}
