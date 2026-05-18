# Thirdweb Whellcolor Cube Crypto (WCC)

A high-performance Multichain Faucet and Mining Dashboard decentralized application (DApp). This project leverages **Reown AppKit (v155)** for multi-wallet connectivity, **Ethers.js (v6)** for blockchain interaction, **Chart.js** for live mining hashrate visualization, and integrates the **Thirdweb Bridge Widget** along with custom logic scripts from the Whellcolor GitHub repository.

---

## 🚀 Features

* **Multichain Wallet Connection:** Unified login using `@reown/appkit` supporting Ethereum, Arbitrum, and Base networks.
* **Token & Gas Faucet:** Automated simulated faucet for Testnets (Base Sepolia, Arbitrum Sepolia, Ethereum Sepolia) and Mainnets.
* **Live Mining Simulator:** Interactive dashboard plotting real-time simulated hashrate dynamics using Chart.js.
* **Dual Reward Claims:** Dedicated modules for automated gas rewards and stateful mining tokens.
* **NFT Supporter Module:** Cross-chain bridge NFT checkout widget natively integrated with Thirdweb.
* **Extensible Architecture:** Embedded support for custom remote logic (`contract.js`, `multi-rpc.js`, and `deploy.js`).

---

## 🛠️ Tech Stack & Dependencies

* **Frontend Interface:** Semantic HTML5, CSS3 Glassmorphism UI
* **Language:** TypeScript (Strict-mode compliant)
* **Web3 Libraries:** `ethers` (v6.13.4), `@reown/appkit`, `@reown/appkit-adapter-ethers`
* **Data Visualization:** `chart.js`
* **Widgets:** Thirdweb Bridge Widget

---

## 📂 Project Structure

```bash
├── index.html       # Cleaned-up UI layout with style sheets
├── dapp.ts          # Consolidated TypeScript DApp core logic
├── package.json     # Node dependencies & build script definitions
└── README.md        # Documentation

```

---

## ⚙️ Installation & Setup

Ensure you have [Node.js](https://nodejs.org/) (v18+) installed. Follow these steps to configure your local development environment:

### 1. Initialize Project & Dependencies

Create a `package.json` file if you don't have one, and install the required modules:

```bash
npm init -y
npm install @reown/appkit @reown/appkit-adapter-ethers ethers

```

If you are using **Vite** as your bundler (highly recommended for TypeScript development), install it as a dev dependency:

```bash
npm install -D vite typescript

```

### 2. Configure TypeScript

Generate a `tsconfig.json` file to manage build targets:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["dapp.ts"]
}

```

---

## 🧑‍💻 Usage & Deployment

### Running Locally (Development Mode)

If using Vite, start the dev server directly. It automatically transpiles and resolves `dapp.ts` from the `index.html` link.

```bash
npx vite

```

Open the provided local URL (usually `http://localhost:5173`) in your browser to test the DApp.

### Building for Production

Compile the TypeScript code and bundle assets for hosting:

```bash
npx vite build

```

The optimized website assets will be placed inside the `dist/` directory, ready to be uploaded to platforms like GitHub Pages, Vercel, or Netlify.

---

## 🌐 Smart Contract & External Script Reference

This DApp connects directly to global external components. If you need to manipulate the methods inside `dapp.ts` to access deeper states of `whellcolor.github.io` libraries, remember that they inject themselves globally into the DOM:

```typescript
// Mapped globally in dapp.ts to circumvent build compiler errors:
declare const ThirdwebContract: any;
declare const MultiRpcProvider: any;
declare const DeployScript: any;

```

---

## 📄 License

This repository is distributed under the MIT License. See `LICENSE` for more information.
