const provider = new ethers.JsonRpcProvider('https://rpc.buildbear.io/global-wolverine-ff979075');
const blockNumber = await provider.getBlockNumber();
console.log(blockNumber);
