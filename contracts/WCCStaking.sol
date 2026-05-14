pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WCCStaking {

    IERC20 public token;

    uint256 public rewardRate = 1 ether; // reward per block (contoh)

    struct StakeInfo {
        uint256 amount;
        uint256 rewardDebt;
        uint256 lastBlock;
    }

    mapping(address => StakeInfo) public stakes;

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }

    function stake(uint256 amount) external {
        require(amount > 0, "0 stake");

        _update(msg.sender);

        token.transferFrom(msg.sender, address(this), amount);

        stakes[msg.sender].amount += amount;
        stakes[msg.sender].lastBlock = block.number;
    }

    function _update(address user) internal {
        StakeInfo storage s = stakes[user];

        if (s.amount > 0) {
            uint256 blocks = block.number - s.lastBlock;
            uint256 reward = blocks * rewardRate * s.amount / 1e18;

            s.rewardDebt += reward;
        }

        s.lastBlock = block.number;
    }

    function claim() external {
        _update(msg.sender);

        uint256 reward = stakes[msg.sender].rewardDebt;
        require(reward > 0, "No reward");

        stakes[msg.sender].rewardDebt = 0;

        token.transfer(msg.sender, reward);
    }

    function unstake(uint256 amount) external {
        require(stakes[msg.sender].amount >= amount, "Not enough");

        _update(msg.sender);

        stakes[msg.sender].amount -= amount;
        token.transfer(msg.sender, amount);
    }
}
