// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
    SmartWalletEVM.sol
    Owner Wallet:
    0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B

    Smart Wallet:
    0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763

    AccountFactory v0.6:
    0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00

    AccountFactory v0.7:
    0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb
*/

contract SmartWalletEVM {

    address public owner =
        0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B;

    address public smartWallet =
        0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763;

    address public accountFactoryV06 =
        0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00;

    address public accountFactoryV07 =
        0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferETH(
        address payable to,
        uint256 amount
    ) external onlyOwner {
        require(address(this).balance >= amount, "Insufficient balance");
        to.transfer(amount);
    }

    function execute(
        address target,
        uint256 value,
        bytes calldata data
    ) external onlyOwner returns (bytes memory) {

        (bool success, bytes memory result) = target.call{value:value}(data);

        require(success, "Transaction failed");

        return result;
    }

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
