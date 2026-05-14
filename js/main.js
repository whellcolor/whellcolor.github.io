async function main() {
  const Token = await ethers.getContractFactory("WCCToken");
  const token = await Token.deploy();

  await token.waitForDeployment();

  const Claim = await ethers.getContractFactory("WCCClaim");
  const claim = await Claim.deploy(token.target);

  await claim.waitForDeployment();

  console.log("Token:", token.target);
  console.log("Claim:", claim.target);
}

main();
