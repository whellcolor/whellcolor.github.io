import { CheckoutWidget, darkTheme } from "thirdweb/react";
import { createThirdwebClient, defineChain } from "thirdweb";
import { createWallet } from "thirdweb/wallets";

const client = createThirdwebClient({
  clientId: "2409d98fbe42fa94fb7ba259d6cf58c9",
});

function Example() {
  return (
    <CheckoutWidget
      theme={darkTheme({
        colors: { accentText: "hsl(0, 0%, 0%)" },
      })}
      client={client}
      description={"NFT Whellcolor Cube Crypto (WCC)"}
      image={"https://whellcolor.github.io/nft /0.png"}
      name={"WCC NFT"}
      currency={"USD"}
      chain={defineChain(2741)}
      amount={"0.01"}
      tokenAddress={"0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE"}
      seller={"0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88"}
    />
  );
}
