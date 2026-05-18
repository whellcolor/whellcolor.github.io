curl --request POST \
     --url https://eth-mainnet.g.alchemy.com/v2/5P3go2AF1svTq0QqCOZUQ \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
{
  "id": 1,
  "jsonrpc": "2.0",
  "method": "alchemy_getAssetTransfers",
  "params": [
    {
      "fromBlock": "0x0",
      "toBlock": "latest",
      "toAddress": "0x5c43B1eD97e52d009611D89b74fA829FE4ac56b1",
      "withMetadata": false,
      "excludeZeroValue": true,
      "maxCount": "0x3e8",
      "category": [
        "external"
      ]
    }
  ]
}
'
