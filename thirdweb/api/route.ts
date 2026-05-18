const response = await fetch("https://api.thirdweb.com/v1/contracts/write", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "x-secret-key": "G8vNXJOMTp_TuTQV3kgFIQyKAz_L21F3a9SW57zKanPEqK7iGCHyTUcHKuujJR1q3G2h7d4VHaIlDeR3yn0Wjw",
  },
  body: JSON.stringify({
    calls: [
      {
        contractAddress: "0x5F4D8e0d0A5f0Ca204a88B1e40e16e8E5Ab016Ec",
        method: "function transfer(address to, uint256 value) returns (bool)",
        params: [to, value],
      },
    ],
    chainId: 137,
    from: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
  }),
});

const data = await response.json();
