// dapp.ts

import { ethers } from "ethers";

// ======================================
// CONFIG
// ======================================

const CONTRACT_ADDRESS =
  "0x5F4D8e0d0A5f0Ca204a88B1e40e16e8E5Ab016Ec";

const FAUCET_ADDRESS =
  "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88";

// ======================================
// GLOBAL
// ======================================

let provider: ethers.providers.Web3Provider;

let signer: ethers.Signer;

let contract: ethers.Contract;

// ======================================
// ABI
// ======================================

const ABI = [

  "function contractBalance() view returns(uint256)",

  "function mintNFT() external",

  "function claimFaucet() external",

  "function swapToken(string fromToken,string toToken,uint256 amount) external"

];

// ======================================
// CONNECT WALLET
// ======================================

export async function connectWallet(): Promise<void> {

  try {

    if (!(window as any).ethereum) {

      alert("Please install MetaMask");

      return;
    }

    await (window as any).ethereum.request({
      method: "eth_requestAccounts"
    });

    provider =
      new ethers.providers.Web3Provider(
        (window as any).ethereum
      );

    signer = provider.getSigner();

    const address =
      await signer.getAddress();

    const walletElement =
      document.getElementById("walletAddress");

    if (walletElement) {

      walletElement.innerHTML =
        `Connected : ${address}`;
    }

    contract =
      new ethers.Contract(
        CONTRACT_ADDRESS,
        ABI,
        signer
      );

    console.log("Wallet Connected:", address);

  } catch (err) {

    console.error(err);

    alert("Wallet connection failed");
  }

}

// ======================================
// GET CONTRACT BALANCE
// ======================================

export async function getBalance(): Promise<void> {

  try {

    const balance =
      await contract.contractBalance();

    const formatted =
      ethers.utils.formatEther(balance);

    const result =
      document.getElementById("result");

    if (result) {

      result.innerHTML =
        `${formatted} MATIC`;
    }

  } catch (err) {

    console.error(err);
  }

}

// ======================================
// SEND TRANSACTION
// ======================================

export async function sendTransaction(): Promise<void> {

  try {

    const receiver =
      (
        document.getElementById(
          "receiver"
        ) as HTMLInputElement
      ).value;

    const amount =
      (
        document.getElementById(
          "amount"
        ) as HTMLInputElement
      ).value;

    const tx =
      await signer.sendTransaction({

        to: receiver,

        value:
          ethers.utils.parseEther(amount)

      });

    await tx.wait();

    alert("Transaction Success");

    console.log("TX HASH:", tx.hash);

  } catch (err) {

    console.error(err);

    alert("Transaction Failed");
  }

}

// ======================================
// MINT NFT
// ======================================

export async function mintNFT(): Promise<void> {

  try {

    const tx =
      await contract.mintNFT();

    await tx.wait();

    alert("NFT Minted");

    console.log("NFT Mint Success");

  } catch (err) {

    console.error(err);

    alert("Mint NFT Failed");
  }

}

// ======================================
// CLAIM FAUCET
// ======================================

export async function claimFaucet(): Promise<void> {

  try {

    const tx =
      await contract.claimFaucet();

    await tx.wait();

    alert("Claim Faucet Success");

  } catch (err) {

    console.error(err);

    alert("Claim Faucet Failed");
  }

}

// ======================================
// SWAP TOKEN
// ======================================

export async function swapToken(): Promise<void> {

  try {

    const tx =
      await contract.swapToken(

        "MATIC",

        "USDC",

        ethers.utils.parseEther("0.9")

      );

    await tx.wait();

    alert("Swap Success");

  } catch (err) {

    console.error(err);

    alert("Swap Failed");
  }

}

// ======================================
// SEND ETH
// ======================================

export async function sendTx(): Promise<void> {

  try {

    const tx =
      await signer.sendTransaction({

        to: FAUCET_ADDRESS,

        value:
          ethers.utils.parseEther("0.0001")

      });

    await tx.wait();

    updateStatus("✅ ETH Sent");

  } catch (err) {

    console.error(err);

    updateStatus("❌ Send Failed");
  }

}

// ======================================
// MINT TOKEN
// ======================================

export async function mintToken(): Promise<void> {

  try {

    const wallet =
      (
        document.getElementById(
          "walletInput"
        ) as HTMLInputElement
      ).value;

    if (!wallet) {

      alert("Input wallet address");

      return;
    }

    updateStatus("⏳ Minting Token...");

    const response =
      await fetch(
        "https://api.thirdweb.com/v1/transactions",
        {
          method: "POST",

          headers: {

            "Content-Type":
              "application/json",

            // WARNING:
            // Jangan expose secret key production

            "x-secret-key":
              "YOUR_SECRET_KEY"
          },

          body: JSON.stringify({

            chainId: "84532",

            from: FAUCET_ADDRESS,

            transactions: [

              {

                type: "contractCall",

                contractAddress:
                  "0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00",

                method:
                  "function mintTo(address to,uint256 amount)",

                params: [wallet, "100"]

              }

            ]

          })

        }
      );

    const data =
      await response.json();

    console.log(data);

    updateStatus("✅ Token Minted");

  } catch (err) {

    console.error(err);

    updateStatus("❌ Mint Failed");
  }

}

// ======================================
// CHECK BALANCE
// ======================================

export async function checkBalance(): Promise<void> {

  try {

    const address =
      await signer.getAddress();

    const balance =
      await provider.getBalance(address);

    updateStatus(

      `Balance : ${ethers.utils.formatEther(balance)} ETH`

    );

  } catch (err) {

    console.error(err);
  }

}

// ======================================
// STATUS HELPER
// ======================================

function updateStatus(message: string): void {

  const status =
    document.getElementById("status");

  if (status) {

    status.innerHTML = message;
  }

}

// ======================================
// GLOBAL WINDOW BINDING
// ======================================

(window as any).connectWallet =
  connectWallet;

(window as any).getBalance =
  getBalance;

(window as any).sendTransaction =
  sendTransaction;

(window as any).mintNFT =
  mintNFT;

(window as any).claimFaucet =
  claimFaucet;

(window as any).swapToken =
  swapToken;

(window as any).sendTx =
  sendTx;

(window as any).mintToken =
  mintToken;

(window as any).checkBalance =
  checkBalance;
