import { ethereum } from "thirdweb/chains";
import { ConnectButton, darkTheme } from "thirdweb/react";
import { createThirdwebClient } from "thirdweb";
import { inAppWallet, createWallet } from "thirdweb/wallets";

const client = createThirdwebClient({
  clientId: "2409d98fbe42fa94fb7ba259d6cf58c9",
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
        "twitch",
        "steam",
        "tiktok",
        "coinbase",
        "guest",
        "facebook",
        "apple",
      ],
    },
  }),
  createWallet("io.metamask"),
  createWallet("com.coinbase.wallet"),
  createWallet("me.rainbow"),
  createWallet("io.rabby"),
  createWallet("io.zerion.wallet"),
  createWallet("com.trustwallet.app"),
  createWallet("com.bestwallet"),
  createWallet("com.bitpay"),
  createWallet("com.binance.wallet"),
  createWallet("io.1inch.wallet"),
  createWallet("org.uniswap"),
  createWallet("com.safepal"),
  createWallet("com.crypto.wallet"),
  createWallet("com.bitcoin"),
  createWallet("com.blockchain.login"),
  createWallet("id.co.pintu"),
  createWallet("app.subwallet"),
  createWallet("so.onekey.app.wallet"),
  createWallet("ag.jup"),
  createWallet("io.magiceden.wallet"),
  createWallet("com.kucoin"),
  createWallet("io.enjin"),
  createWallet("org.creditcoin.app"),
  createWallet("app.everspace"),
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
        colors: { accentText: "hsl(0, 0%, 0%)" },
      })}
      wallets={wallets}
    />
  );
}
