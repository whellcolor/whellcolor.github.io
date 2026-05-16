// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Faucet {

    mapping(address => uint256) public lastClaim;

    function claim() external {
        require(
            block.timestamp > lastClaim[msg.sender] + 1 days,
            "Wait 24 hours"
        );

        lastClaim[msg.sender] = block.timestamp;

        payable(msg.sender).transfer(0.01 ether);
    }

    receive() external payable {}
}
