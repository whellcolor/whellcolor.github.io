@echo off
curl https://rpc.buildbear.io/global-wolverine-ff979075 ^
     -X POST ^
     -H "Content-Type: application/json" ^
     -d "{\"jsonrpc\":\"2.0\",\"method\":\"eth_blockNumber\",\"params\":[],\"id\":1}"
pause
