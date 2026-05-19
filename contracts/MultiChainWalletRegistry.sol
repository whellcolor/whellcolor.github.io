// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract MultiChainWalletRegistry {

    address public owner = 0x5e8bade6E0Bce65807dB6327cB1d9Eeb7C6A6A5B;

    // =========================
    // MULTI CHAIN ADDRESSES (INFO ONLY)
    // =========================
    struct Wallet {
        string eth;
        string solana;
        string btc;
        string doge;
        string ltc;
        string fio;
        string icp;
        string iotx;
        string zil;
        string egld;
        string osmo;
        string flux;
        string juno;
        string firo;
        string xrp;
    }

    Wallet public wallets;

    constructor() {
        wallets = Wallet({
            eth: "0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b",
            solana: "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W",
            btc: "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt",
            doge: "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov",
            ltc: "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf",
            fio: "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e",
            icp: "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053",
            iotx: "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w",
            zil: "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d",
            egld: "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8",
            osmo: "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5",
            flux: "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv",
            juno: "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6",
            firo: "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR",
            xrp: "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk"
        });
    }

    // =========================
    // ETH RECEIVER
    // =========================
    event ReceivedETH(address indexed from, uint256 amount);

    receive() external payable {
        emit ReceivedETH(msg.sender, msg.value);
    }

    // =========================
    // ERC20 RECEIVER LOGIC
    // =========================
    event ReceivedToken(address indexed token, address indexed from, uint256 amount);

    function withdrawToken(address token, uint256 amount) external {
        require(msg.sender == owner, "Not owner");
        IERC20(token).transfer(owner, amount);
    }

    function withdrawETH(uint256 amount) external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(amount);
    }

    function ethBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function tokenBalance(address token) external view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }

    // =========================
    // KNOWN TOKENS
    // =========================
    address public WBTC = 0x55Cc56b92b7fa0de7CDa22d263532F2910b9b17B;
    address public PEPE = 0xBCf75f81D7A74cf18a41C267443F0fF3E1A9A671;
    address public USDT = 0xc8648a893357e9893669036Be58aFE71B8140eD6;
}
