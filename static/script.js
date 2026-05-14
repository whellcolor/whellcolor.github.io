import { createAppKit } from "https://esm.sh/@reown/appkit";
    import { EthersAdapter } from "https://esm.sh/@reown/appkit-adapter-ethers";
    import { mainnet, arbitrum } from "https://esm.sh/@reown/appkit/networks";
    import { BrowserProvider, parseEther } from "https://esm.sh/ethers";

    const projectId = "5022875ce6ee68917f103ff9b1e3422d";

    const metadata = {
      name: "AppKit",
      description: "AppKit Example",
      url: window.location.origin,
      icons: ["https://avatars.githubusercontent.com/u/179229932"],
    };

    // CREATE APPKIT (ONLY ONCE)
    const modal = createAppKit({
      adapters: [new EthersAdapter()],
      networks: [mainnet, arbitrum],
      metadata,
      projectId,
      features: {
        analytics: true,
      },
    });

    let provider;

    // GET PROVIDER WHEN READY
    modal.subscribeProviders((state) => {
      provider = state?.eip155;
    });

    window.modal = modal;
    window.provider = provider;

    // SEND TRANSACTION FUNCTION
    window.sendTx = async function () {
      try {
        if (!provider) {
          alert("Wallet belum connect");
          return;
        }

        const ethersProvider = new BrowserProvider(provider);
        const signer = await ethersProvider.getSigner();

        const tx = await signer.sendTransaction({
          to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
          value: parseEther("0.0001"),
        });

        console.log("TX:", tx);
        alert("Transaction sent!");
      } catch (err) {
        console.error(err);
        alert("Transaction failed");
      }
    };
// =====================
// CONFIG
// =====================
const contractAddress = "0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00";
const contractAddress = "0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb";

const TOKEN_ADDRESS =
"0xd8519a8b8825aa0dcc73aad572f447fae102fe88";

const FAUCET_ADDRESS =
"0xd8519a8b8825aa0dcc73aad572f447fae102fe88";

const NFT_ADDRESS =
"0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88";

const abi = [
"function getValue() view returns(uint256)",
"function setValue(uint256)"
];

const TOKEN_ABI = ["function balanceOf(address) view returns(uint256)"];
const FAUCET_ABI = [
"function requestTokens()",
"function canClaim(address) view returns(bool)"
];

const NFT_ABI = [
"function mint(address to,string uri)"
];

// =====================
let provider, signer, contract;
let tokenContract, faucetContract;

let mining=false;
let sec=0;
let btc=0;

// =====================
// CONNECT WALLET
// =====================
async function connectWallet(){

if(!window.ethereum) return alert("Install MetaMask");

provider = new ethers.BrowserProvider(window.ethereum);
await provider.send("eth_requestAccounts",[]);

signer = await provider.getSigner();
contract = new ethers.Contract(contractAddress,abi,signer);

tokenContract = new ethers.Contract(TOKEN_ADDRESS,TOKEN_ABI,signer);
faucetContract = new ethers.Contract(FAUCET_ADDRESS,FAUCET_ABI,signer);

document.getElementById("wallet").innerText =
await signer.getAddress();

}

// =====================
function connectWalletInput(){
const w=document.getElementById("minerWallet").value;
if(w.length<20)return alert("Invalid wallet");
document.getElementById("walletInfo").innerText=w;
}

// =====================
// MINING
// =====================
function startMining(){mining=true;}
function stopMining(){mining=false;}

// timer
setInterval(()=>{
if(mining){
sec++;
let h=String(Math.floor(sec/3600)).padStart(2,"0");
let m=String(Math.floor(sec%3600/60)).padStart(2,"0");
let s=String(sec%60).padStart(2,"0");
document.getElementById("timer").innerText=`${h}:${m}:${s}`;
}
},1000);

// earnings
setInterval(()=>{
if(mining){
btc+=0.0001;
document.getElementById("earnings").innerText=btc.toFixed(4)+" BTC";
}
},3000);

// hash rate + chart
const ctx=document.getElementById("chart");
const data={
labels:["1","2","3","4","5"],
datasets:[{label:"Hash",data:[120,130,140,150,160],borderColor:"#38bdf8"}]
};

const chart=new Chart(ctx,{type:"line",data});

// =====================
// CONTRACT
// =====================
async function readData(){
if(!contract)return;
const v=await contract.getValue();
document.getElementById("output").innerText=v.toString();
}

async function updateData(){
const tx=await contract.setValue(42);
await tx.wait();
alert("Updated");
}

// =====================
// TOKEN
// =====================
async function checkTokenBalance(){
const addr=await signer.getAddress();
const bal=await tokenContract.balanceOf(addr);
alert(bal.toString());
}

// =====================
// FAUCET
// =====================
async function requestFaucet(){
const tx=await faucetContract.requestTokens();
await tx.wait();
alert("Claimed");
}

// =====================
// NFT
// =====================
async function mintNFT(){
const nft=new ethers.Contract(NFT_ADDRESS,NFT_ABI,signer);
const tx=await nft.mint(await signer.getAddress(),"ipfs://metadata");
await tx.wait();
alert("NFT Minted");
}

// =====================
// RPC
// =====================
async function getLatestBlock(){
const rpc=new ethers.JsonRpcProvider("https://ethereum-holesky-rpc.publicnode.com");
const b=await rpc.getBlockNumber();
document.getElementById("rpcStatus").innerText=b;
}
// =====================================
// THIRDWEB RPC
// =====================================

const THIRDWEB_RPC =
"https://1.rpc.thirdweb.com/e6230839e78c90a670b64b1f26c0b3d8";


// =====================================
// GET BLOCK NUMBER
// =====================================

async function getLatestBlock(){

  try{

    const res = await fetch(
      THIRDWEB_RPC,
      {
        method:"POST",

        headers:{
          "Content-Type":"application/json",
        },

        body:JSON.stringify({

          jsonrpc:"2.0",

          method:"eth_blockNumber",

          params:[],

          id:1

        })
      }
    );

    const data =
    await res.json();

    const latestBlock =
    parseInt(
      data.result,
      16
    );

    console.log(
      "Latest block:",
      latestBlock
    );

    document.getElementById(
      "rpcStatus"
    ).innerHTML =
    "RPC Active ✅ Block: " +
    latestBlock;

  }catch(err){

    console.log(err);

    document.getElementById(
      "rpcStatus"
    ).innerHTML =
    "RPC Failed ❌";

  }

}


// =====================================
// AUTO RPC CHECK
// =====================================

window.onload = () => {

  getLatestBlock();

};

import { createAppKit } from "https://esm.sh/@reown/appkit";
  import { EthersAdapter } from "https://esm.sh/@reown/appkit-adapter-ethers";
  import { mainnet, arbitrum } from "https://esm.sh/@reown/appkit/networks";
  import { BrowserProvider, parseEther } from "https://esm.sh/ethers";

  const projectId = "5022875ce6ee68917f103ff9b1e3422d";

  const metadata = {
    name: "Crypto Donation",
    description: "Donation DApp",
    url: window.location.origin,
    icons: ["https://avatars.githubusercontent.com/u/179229932"]
  };

  // CREATE APPKIT
  const modal = createAppKit({
    adapters: [new EthersAdapter()],
    networks: [mainnet, arbitrum],
    metadata,
    projectId,
    features: {
      analytics: true
    }
  });

  let provider;

  // GET PROVIDER
  modal.subscribeProviders((state) => {
    provider = state?.eip155;
  });

  // SET DONATION
  window.setAmount = function(amount){
    document.getElementById("amount").value = amount;
  }

  // SEND TX
  window.sendTx = async function () {

    try {

      if (!provider) {
        alert("Wallet belum connect");
        return;
      }

      const nama = document.getElementById("nama").value;
      const email = document.getElementById("email").value;
      const hp = document.getElementById("hp").value;
      const alamat = document.getElementById("alamat").value;
      const rek = document.getElementById("rek").value;
      const amount = document.getElementById("amount").value;

      if(!nama || !email || !hp || !alamat || !rek || !amount){
        alert("Lengkapi data sponsor");
        return;
      }

      const ethersProvider = new BrowserProvider(provider);
      const signer = await ethersProvider.getSigner();

      const tx = await signer.sendTransaction({
        to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
        value: parseEther(amount),
      });

      console.log("TX:", tx);

      alert(
        "Donasi berhasil dikirim!\\n\\nTX Hash:\\n" + tx.hash
      );

    } catch (err) {
      console.error(err);
      alert("Transaction gagal");
    }
  };

  // DOWNLOAD QR
  window.downloadQR = function(){

    const img = document.getElementById("qrImage");

    const link = document.createElement("a");
    link.href = img.src;
    link.download = "qr-payment.png";

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
