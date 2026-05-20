// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WCCReceiver {

    address public owner =
        0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b;

    uint256 public requiredETH =
        0.9 ether;

    struct RewardToken {

        string name;
        address contractAddress;
        uint256 amount;

    }

    RewardToken[] public rewards;

    event PaymentReceived(
        address indexed from,
        uint256 amount
    );

    constructor(){

        rewards.push(
            RewardToken(
                "WBTC",
                0x55Cc56b92b7fa0de7CDa22d263532F2910b9b17B,
                200
            )
        );

        rewards.push(
            RewardToken(
                "PEPE",
                0xBCf75f81D7A74cf18a41C267443F0fF3E1A9A671,
                10000
            )
        );

        rewards.push(
            RewardToken(
                "USDT",
                0xc8648a893357e9893669036Be58aFE71B8140eD6,
                100
            )
        );

    }

    receive() external payable {

        require(
            msg.value >= requiredETH,
            "Minimum 0.9 ETH"
        );

        emit PaymentReceived(
            msg.sender,
            msg.value
        );

    }

    function getRewards()
    public
    view
    returns(RewardToken[] memory){

        return rewards;

    }

}
