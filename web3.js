const web3 = new Web3("https://rpc.buildbear.io/global-wolverine-ff979075");
const blockNumber = await web3.eth.getBlockNumber();
console.log(Number(blockNumber));
