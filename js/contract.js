const CLAIM_CONTRACT = "0xYOUR_CLAIM_ADDRESS";

window.sendTx = async function () {
  if (!provider) return alert("Wallet not connected");

  const ethersProvider = new BrowserProvider(provider);
  const signer = await ethersProvider.getSigner();

  const contract = new Contract(
    CLAIM_CONTRACT,
    ["function claim() payable"],
    signer
  );

  const tx = await contract.claim({
    value: parseEther("0.0001"),
  });

  alert("Claim TX: " + tx.hash);
};
