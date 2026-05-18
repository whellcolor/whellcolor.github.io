curl -X POST https://api.thirdweb.com/v1/contracts \
-H "x-secret-key:G8vNXJOMTp_TuTQV3kgFIQyKAz_L21F3a9SW57zKanPEqK7iGCHyTUcHKuujJR1q3G2h7d4VHaIlDeR3yn0Wjw" \
-d '{
  "chainId": 1,
  "from": "0x1234567890123456789012345678901234567890",
  "bytecode": "0x608060405234801561001057600080fd5b50...",
  "abi": [
    {
      "type": "constructor",
      "inputs": [
        {
          "name": "defaultAdmin",
          "type": "address"
        }
      ]
    },
    {
      "type": "function",
      "name": "name",
      "inputs": [],
      "outputs": [
        {
          "type": "string"
        }
      ],
      "stateMutability": "view"
    }
  ],
  "constructorParams": {
    "defaultAdmin": "0x1234567890123456789012345678901234567890"
 "CONTRACT_ADDRESS": "0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00",
"CONTRACT_ADDRESS": "0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B",
"CONTRACT_ADDRESS": "0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763",
"CONTRACT_OWNER": "0xdd99b75f095d0c4d5112ace938e4e6ed962fb024",
"CONTRACT_OWNER": "0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb",
"CONTRACT_OWNER": "0x171b9f078bc82f8be12c94a4de09cbe3051b1ea7",
"CONTRACTOR_WALLET": "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
"CONTRACTOR_WALLET": "0x69e21CfA3f4250096Ec98eF3690bF70b784B10f8",
"CONTRACTOR_WALLET": "0x579a78B234E9b26922ce7a7fFb6d1aacd65db5bc",


}
}'
