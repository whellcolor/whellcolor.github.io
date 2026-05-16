// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiWalletManager {

    address public owner;

    // daftar wallet
    address[] public wallets;

    // status wallet
    mapping(address => bool) public isWallet;

    constructor() {

        owner = 0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88;

        

        _addAdmin(0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88);
        _addAdmin(0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B);
        _addAdmin(0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763);
        _addAdmin(0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00);
        _addAdmin(0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb);
        _addAdmin(0x579a78B234E9b26922ce7a7fFb6d1aacd65db5bc);
        _addAdmin(0x0164FE4636d4E6485eE414A467740ba301B4811D);
        _addAdmin(0x69e21CfA3f4250096Ec98eF3690bF70b784B10f8);
        _addAdmin(0x0B1D1772d04648aABF617eD026778B272cc40f64);
        _addAdmin(0xC7E94F0257d066ce7B4CA52C2FdA33d7f01c38Ab);
        _addAdmin(0x27eC563CF862452b3313Dc1E8662a1B609b147cd);
        _addAdmin(0x171b9f078bc82f8be12c94a4de09cbe3051b1ea7);
    }

    function _addWallet(address wallet) internal {

        require(wallet != address(0), "invalid wallet");

        if (!isWallet[wallet]) {
            wallets.push(wallet);
            isWallet[wallet] = true;
        }
    }

    function addWallet(address wallet) external {

        require(msg.sender == owner, "not owner");

        _addWallet(wallet);
    }

    function getWallets() external view returns(address[] memory) {
        return wallets;
    }

    // distribute balance
    function distribute() external payable {

        require(wallets.length > 0, "no wallets");

        uint256 amount = msg.value / wallets.length;

        for(uint256 i = 0; i < wallets.length; i++) {
            payable(wallets[i]).transfer(amount);
        }
    }

    receive() external payable {}
}
