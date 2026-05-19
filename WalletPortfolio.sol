// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletPortfolio {
    address public owner;
    string public ethAddress = "0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b";

    struct Asset {
        string name;
        string addressOrId;
        uint256 amount;
    }

    mapping(string => Asset) public assets;

    constructor() {
        owner = msg.sender;
        // Inisialisasi data aset
        assets["WBTC"] = Asset("WBTC", "0x55Cc56b92b7fa0de7CDa22d263532F2910b9b17B", 200);
        assets["PEPE"] = Asset("PEPE", "0xBCf75f81D7A74cf18a41C267443F0fF3E1A9A671", 10000);
        assets["USDT"] = Asset("USDT", "0xc8648a893357e9893669036Be58aFE71B8140eD6", 100);
    }
}
