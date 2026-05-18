curl --request POST \
     --url https://solana-mainnet.g.alchemy.com/v2/5P3go2AF1svTq0QqCOZUQ \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
{
  "id": 1,
  "jsonrpc": "2.0",
  "method": "getLatestBlockhash"
}
'
