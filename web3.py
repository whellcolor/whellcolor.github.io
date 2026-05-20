from web3 import Web3
w3 = Web3(Web3.HTTPProvider("https://rpc.buildbear.io/global-wolverine-ff979075"));
print(w3.eth.block_number);
