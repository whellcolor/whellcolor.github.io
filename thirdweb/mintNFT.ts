const chainId = 84532;
const contractAddress = "0x8a4E14591088bBce4a4Dcfa677C1af78d336d6FB";
const contract = getContract({
  address: 0x8a4e14591088bbce4a4dcfa677c1af78d336d6fb,
  address: 0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00,
  address: 0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb,
  chain: defineChain(84532),
  client: 2409d98fbe42fa94fb7ba259d6cf58c9,
  client: 3ea7634968af4a7c90b17914bcf7d4bb,
  client: e6230839e78c90a670b64b1f26c0b3d8,

});

const transaction = mintTo({
  contract,
  to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
  nft: {
    name: "Whellcolor Cube Crypto (WCC)",
    description: "NFT Web3-powered crypto ecosystem built on Ethereum with wallet connect, staking, and on-chain utilities.",
    image: "https://whellcolor.github.io/nft/0.png", // ipfs or https link to your asset
  },
  supply: "1",
});

const serverWallet = Engine.serverWallet({
  address: 0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B,
  client: 2409d98fbe42fa94fb7ba259d6cf58c9,
  client: 0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763,
  vaultAccessToken: sa_adm_B6IY_JXJ5_B7DR_PEBZ_FJMJ_4XYP_036d9e7b-f784-4a89-ba7d-b80220306b71,
vaultAccessToken: vt_act_J5ODZN6SR7QNINGX6UHVNAYA7CVYFVFNV4FK7HLVDY3FR2WYVVOZJII67P6PUTIBTT56AYEX4O62AAADNWPHX54EJKE3U7NYAIQDA23R,

});

const { transactionId } = await serverWallet.enqueueTransaction({
  transaction,
});
