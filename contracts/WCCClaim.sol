pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WCCClaim is Ownable {

    IERC20 public token;

    uint256 public rate = 1000 * 10**18; 
    // 1 ETH = 1000 WCC (contoh)

    mapping(address => uint256) public claimed;

    constructor(address tokenAddress) Ownable(msg.sender) {
        token = IERC20(tokenAddress);
    }

    function claim() external payable {
        require(msg.value > 0, "Send ETH");

        uint256 amount = msg.value * rate;
        claimed[msg.sender] += msg.value;

        require(token.transfer(msg.sender, amount), "Transfer failed");
    }

    function withdrawETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
