pragma solidity ^0.8.20;

contract WCCVault {
    address public owner;

    constructor() {
        owner = 0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88;
    }

    receive() external payable {}

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}
