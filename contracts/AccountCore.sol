solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * MultiWalletRegistry.sol
 * Simple multi-chain wallet & token registry contract
 */

contract MultiWalletRegistry {

    address public owner;

    struct WalletData {
        string chain;
        string wallet;
    }

    struct TokenData {
        string symbol;
        address contractAddress;
        uint256 amount;
    }

    WalletData[] public wallets;
    TokenData[] public tokens;

    constructor() {
        owner = msg.sender;

        // Wallet Addresses
        wallets.push(WalletData(
            "ETH",
            "0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b"
        ));

        wallets.push(WalletData(
            "SOL",
            "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W"
        ));

        wallets.push(WalletData(
            "BTC",
            "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt"
        ));

        wallets.push(WalletData(
            "DOGE",
            "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov"
        ));

        wallets.push(WalletData(
            "LTC",
            "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf"
        ));

        wallets.push(WalletData(
            "FIO",
            "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e"
        ));

        wallets.push(WalletData(
            "ICP",
            "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053"
        ));

        wallets.push(WalletData(
            "IOTX",
            "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w"
        ));

        wallets.push(WalletData(
            "ZIL",
            "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d"
        ));

        wallets.push(WalletData(
            "EGLD",
            "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8"
        ));

        wallets.push(WalletData(
            "OSMO",
            "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5"
        ));

        wallets.push(WalletData(
            "FLUX",
            "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv"
        ));

        wallets.push(WalletData(
            "JUNO",
            "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6"
        ));

        wallets.push(WalletData(
            "FIRO",
            "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR"
        ));

        wallets.push(WalletData(
            "XRP",
            "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk"
        ));

        // Token Registry
        tokens.push(TokenData(
            "WBTC",
            0x55Cc56b92b7fa0de7CDa22d263532F2910b9b17B,
            200
        ));

        tokens.push(TokenData(
            "PEPE",
            0xBCf75f81D7A74cf18a41C267443F0fF3E1A9A671,
            10000
        ));

        tokens.push(TokenData(
            "USDT",
            0xc8648a893357e9893669036Be58aFE71B8140eD6,
            100
        ));
    }

    function getWalletCount() external view returns (uint256) {
        return wallets.length;
    }

    function getTokenCount() external view returns (uint256) {
        return tokens.length;
    }

    function getWallet(
        uint256 index
    ) external view returns (string memory, string memory) {
        WalletData memory w = wallets[index];
        return (w.chain, w.wallet);
    }

    function getToken(
        uint256 index
    ) external view returns (
        string memory,
        address,
        uint256
    ) {
        TokenData memory t = tokens[index];
        return (
            t.symbol,
            t.contractAddress,
            t.amount
        );
    }
}
`
