// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WhellColorContract {

    address public owner;
    address public contractorWallet;

    string public projectName = "WhellColor";
    string public website = "https://whellcolor.github.io/";

    string public rpcUrl =
        "https://rpc.buildbear.io/global-wolverine-ff979075";

    string public apiKey =
        "8WRIDBMW18HXAB44ATGX7IPYGSHXVXDVC3";

    string public verificationMessage =
        "[Etherscan.io 15/05/2026 07:00:51] I, hereby verify that I am the owner/creator of the address [0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00]";

    bytes public signatureHash =
        hex"370ba6f1643c62d130ac39a94466c29b8076404f3fe91a57b1329bfe7cee5d2e198c6987fe4de30adcbac2a33f20eb8609c09f8d3e603cc3f159c9520516420d1b";

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor(address _contractorWallet) {
        owner = msg.sender;
        contractorWallet = _contractorWallet;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    function transferOwnership(address newOwner)
        external
        onlyOwner
    {
        require(newOwner != address(0), "Invalid address");

        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function updateContractorWallet(address newWallet)
        external
        onlyOwner
    {
        require(newWallet != address(0), "Invalid wallet");
        contractorWallet = newWallet;
    }

    function getContractInfo()
        external
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            address,
            address
        )
    {
        return (
            projectName,
            website,
            rpcUrl,
            apiKey,
            owner,
            contractorWallet
        );
    }
}
