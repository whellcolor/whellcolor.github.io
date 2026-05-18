import { Engine } from "thirdweb";

export const serverWallet = Engine.serverWallet({
  address: "0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B",
  client: process.env.THIRDWEB_CLIENT,
  vaultAccessToken: process.env.VAULT_ACCESS_TOKEN,
});
