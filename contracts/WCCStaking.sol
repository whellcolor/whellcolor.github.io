pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WCCStaking {

address public mainOwner;

    mapping(address => bool) public isAdmin;
    address[] public adminList;

    uint256 public claimAmount = 0.09 ether;

    constructor() {
        mainOwner = 0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88;

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
