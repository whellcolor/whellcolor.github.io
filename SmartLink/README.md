# DappMiner SmartLink Generator

Smart Wallet + Trust Wallet + QR Generator berbasis Web3.

## Features

- SmartLink Generator
- Trust Wallet Deep Link
- QR Code Generator
- Download QR Code
- Copy Smart Link
- Dynamic Wallet Explorer
- Etherscan Viewer
- PolygonScan Viewer
- Blockchair Viewer
- WalletConnect AppKit
- Smart Wallet EVM
- Thirdweb Integration
- RPC BuildBear
- Mobile Responsive
- GitHub Pages Ready

---

# Live Demo

https://whellcolor.github.io/SmartLink/generator/

---

# Wallet Features

## Wallet Server

```txt
0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B
````

## Smart Wallet

```txt
0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763
```

---

# Thirdweb Configuration

## Team ID

```txt
team_cmozfq6ko0dibam0l40oarjzt
```

## Client ID

```txt
2409d98fbe42fa94fb7ba259d6cf58c9
```

Dashboard:

[https://thirdweb.com/team/dappminer](https://thirdweb.com/team/dappminer)

---

# RPC

## BuildBear RPC

```txt
https://rpc.buildbear.io/global-wolverine-ff979075
```

---

# Smart Wallet Factories

## AccountFactory v0.6

```txt
0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00
```

## AccountFactory v0.7

```txt
0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb
```

---

# Wallet Explorer

## Etherscan

[https://etherscan.io](https://etherscan.io)

## PolygonScan

[https://polygonscan.com](https://polygonscan.com)

## Blockchair

[https://blockchair.com](https://blockchair.com)

---

# AppKit WalletConnect

## Supported Wallets

* MetaMask
* Trust Wallet
* Coinbase Wallet
* Rainbow
* WalletConnect
* Safe Wallet
* Binance Wallet

---

# Project Structure

```txt
SmartLink/
│
├── index.html
├── README.md
└── js/
    └── mainnet.js
```

---

# mainnet.js

Create file:

```txt
/js/mainnet.js
```

Example:

```javascript
import { createAppKit } from 'https://esm.sh/@reown/appkit'
import { EthersAdapter } from 'https://esm.sh/@reown/appkit-adapter-ethers'
import { mainnet, polygon, bsc } from 'https://esm.sh/@reown/appkit/networks'

const projectId = '2409d98fbe42fa94fb7ba259d6cf58c9'

const metadata = {
  name: 'DappMiner',
  description: 'Smart Wallet Generator',
  url: 'https://whellcolor.github.io',
  icons: ['https://whellcolor.github.io/icon.png']
}

createAppKit({
  adapters: [new EthersAdapter()],
  projectId,
  networks: [mainnet, polygon, bsc],
  metadata,
  features: {
    analytics: true
  }
})
```

---

# Installation

## Clone Repository

```bash
git clone https://github.com/whellcolor/SmartLink.git
```

---

# Open Project

```bash
cd SmartLink
```

---

# Run Local Server

VSCode Live Server:

```txt
Right Click -> Open with Live Server
```

or

Python:

```bash
python -m http.server 8000
```

---

# GitHub Pages

Enable:

```txt
Settings -> Pages -> Deploy from branch
```

Branch:

```txt
main
```

Folder:

```txt
/root
```

---

# Libraries

## QRCodeJS

[https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js](https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js)

## Ethers.js

[https://cdn.jsdelivr.net/npm/ethers@5.7.2/dist/ethers.umd.min.js](https://cdn.jsdelivr.net/npm/ethers@5.7.2/dist/ethers.umd.min.js)

## Reown AppKit

[https://reown.com/appkit](https://reown.com/appkit)

---

# SmartLink Format

Example:

```txt
ethereum:0xWallet@1/transfer?address=0xWallet&uint256=10000000000000000
```

---

# Features Overview

| Feature             | Status |
| ------------------- | ------ |
| SmartLink Generator | ✅      |
| QR Generator        | ✅      |
| Download QR         | ✅      |
| WalletConnect       | ✅      |
| AppKit              | ✅      |
| Thirdweb            | ✅      |
| Etherscan Viewer    | ✅      |
| PolygonScan Viewer  | ✅      |
| Blockchair Viewer   | ✅      |
| Mobile Responsive   | ✅      |
| GitHub Pages        | ✅      |

---

# Security Notes

* Never expose private keys
* Never hardcode seed phrase
* Use HTTPS only
* Verify wallet addresses before sending

---

# License

MIT License

---

# Developer

## DappMiner

GitHub:

[https://github.com/whellcolor](https://github.com/whellcolor)

Website:

[https://whellcolor.github.io](https://whellcolor.github.io)

---

# Donate

## ETH / EVM

```txt
0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B
```

---

# Credits

* Ethers.js
* QRCodeJS
* Reown AppKit
* Thirdweb
* WalletConnect
* BuildBear RPC

```

Project links:

- :contentReference[oaicite:0]{index=0}
- :contentReference[oaicite:1]{index=1}
- :contentReference[oaicite:2]{index=2}
- :contentReference[oaicite:3]{index=3}
```

# 🚀 Dukung Proyek Ini

## 🪙 Wallet Ethereum
Scan QR berikut untuk mengirim donasi:

![QR Ethereum](https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=ethereum:0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88)

Atau kirim langsung ke wallet:  
`0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88`  

🔗 [Buka di Etherscan](https://etherscan.io/address/0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88)

---

## 💳 Langganan Layanan (PayPal)

Pilih paket langganan sesuai kebutuhan:  

[![Subscribe](https://www.paypalobjects.com/en_US/i/btn/btn_subscribe_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JZ8YZT9LM257A)

📌 Paket tersedia:  

| Paket      | Harga | Durasi |
|-----------|-------|--------|
| Subcribe  | $5    | Mingguan |
| Premium   | $25   | Bulanan |
| Golden    | $100  | Tahunan |

---

## 📌 Informasi Tambahan

<details>
<summary>FAQ / Cara Donasi</summary>

1. **Bagaimana cara scan QR?**  
   Gunakan wallet Ethereum seperti MetaMask, TrustWallet, atau Rainbow untuk scan kode QR di atas.  

2. **Bagaimana berlangganan via PayPal?**  
   Klik tombol PayPal, pilih paket yang kamu inginkan, lalu konfirmasi pembayaran.  

3. **Apakah aman?**  
   Semua transaksi dilakukan langsung melalui wallet atau PayPal resmi, tidak ada penyimpanan dana di server proyek.
</details>

---

## 🔗 Tautan Lain
- [Thirdweb Project](https://thirdweb.com/)  
- [Ethereum Explorer](https://etherscan.io/)  
- [Supabase](https://supabase.com/)  

---

> ⚠️ **Catatan:** Jangan pernah menaruh private key atau secret key di README.md atau repository publik.

# 📬 Crypto Wallet Address Book

Simpan dan gunakan alamat wallet berikut untuk transaksi crypto Anda.
Klik tombol salin untuk menyalin address dengan cepat.

---

## 🟣 Ethereum (ETH)

```txt
0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b
```

<button onclick="navigator.clipboard.writeText('0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b')">📋 Salin ETH</button>

---

## ☀️ Solana (SOL)

```txt
CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W
```

<button onclick="navigator.clipboard.writeText('CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W')">📋 Salin SOL</button>

---

## 🟠 Bitcoin (BTC)

```txt
bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt
```

<button onclick="navigator.clipboard.writeText('bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt')">📋 Salin BTC</button>

---

## 💉 Injective (INJ)

```txt
inj1t696mehqhnn9sp7mvvnuk8v7ad7x56jm5gslj6
```

<button onclick="navigator.clipboard.writeText('inj1t696mehqhnn9sp7mvvnuk8v7ad7x56jm5gslj6')">📋 Salin INJ</button>

---

## 🐶 Dogecoin (DOGE)

```txt
DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov
```

<button onclick="navigator.clipboard.writeText('DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov')">📋 Salin DOGE</button>

---

## ⚪ Litecoin (LTC)

```txt
ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf
```

<button onclick="navigator.clipboard.writeText('ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf')">📋 Salin LTC</button>

---

## 🔵 FIO

```txt
FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e
```

<button onclick="navigator.clipboard.writeText('FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e')">📋 Salin FIO</button>

---

## ♾ ICP

```txt
8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053
```

<button onclick="navigator.clipboard.writeText('8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053')">📋 Salin ICP</button>

---

## 🌐 IOTX

```txt
io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w
```

<button onclick="navigator.clipboard.writeText('io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w')">📋 Salin IOTX</button>

---

## ⚡ Zilliqa (ZIL)

```txt
zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d
```

<button onclick="navigator.clipboard.writeText('zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d')">📋 Salin ZIL</button>

---

## 👑 MultiversX (eGLD)

```txt
erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8
```

<button onclick="navigator.clipboard.writeText('erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8')">📋 Salin eGLD</button>

---

## 🧪 Osmosis (OSMO)

```txt
osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5
```

<button onclick="navigator.clipboard.writeText('osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5')">📋 Salin OSMO</button>

---

## 🔋 Flux (FLUX)

```txt
t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv
```

<button onclick="navigator.clipboard.writeText('t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv')">📋 Salin FLUX</button>

---

## 🌕 JUNO

```txt
juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6
```

<button onclick="navigator.clipboard.writeText('juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6')">📋 Salin JUNO</button>

---

## 🔥 FIRO

```txt
aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR
```

<button onclick="navigator.clipboard.writeText('aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR')">📋 Salin FIRO</button>

---

## 💎 XRP

```txt
rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk
```

<button onclick="navigator.clipboard.writeText('rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk')">📋 Salin XRP</button>

---

## 🚀 TRON (TRX)

```txt
TBh1vo5wazVxz5FCqmkVZSDAG2RgXJRPbo
```

<button onclick="navigator.clipboard.writeText('TBh1vo5wazVxz5FCqmkVZSDAG2RgXJRPbo')">📋 Salin TRX</button>

---

# ✅ Catatan

* Pastikan jaringan pengiriman sesuai dengan wallet tujuan.
* Selalu cek ulang address sebelum transfer.
* Simpan file ini sebagai `README.md` agar tampil rapi di GitHub atau website.

