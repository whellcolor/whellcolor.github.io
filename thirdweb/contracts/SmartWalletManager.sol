// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SmartWalletFullSystem {

    address public owner =
        0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B;

    address public smartWallet =
        0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763;

    address public accountFactoryV06 =
        0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00;

    address public accountFactoryV07 =
        0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb;

    uint256 public claimReward = 0.9 ether;

    struct LogTransaction {
        address sender;
        address receiver;
        uint256 amount;
        string action;
        uint256 timestamp;
    }

    LogTransaction[] public logs;

    mapping(address => uint256) public minerRewards;
    mapping(address => uint256) public faucetClaims;
    mapping(address => uint256) public mintedNFT;
    mapping(address => bool) public authorized;

    event ETHReceived(
        address indexed sender,
        uint256 amount
    );

    event ETHSent(
        address indexed receiver,
        uint256 amount
    );

    event SwapExecuted(
        address indexed user,
        string fromToken,
        string toToken,
        uint256 amount
    );

    event FaucetClaimed(
        address indexed user,
        uint256 amount
    );

    event NFTMinted(
        address indexed user,
        uint256 amount
    );

    event MinerReward(
        address indexed miner,
        uint256 amount
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyAuthorized() {
        require(
            authorized[msg.sender] ||
            msg.sender == owner,
            "Not authorized"
        );
        _;
    }

    constructor() {
        authorized[owner] = true;
    }

    receive() external payable {

        logs.push(
            LogTransaction(
                msg.sender,
                address(this),
                msg.value,
                "receive",
                block.timestamp
            )
        );

        emit ETHReceived(
            msg.sender,
            msg.value
        );
    }

    function contractBalance()
        public
        view
        returns(uint256)
    {
        return address(this).balance;
    }

    function sendETH(
        address payable to,
        uint256 amount
    )
        external
        onlyAuthorized
    {
        require(
            address(this).balance >= amount,
            "Insufficient balance"
        );

        to.transfer(amount);

        logs.push(
            LogTransaction(
                address(this),
                to,
                amount,
                "send",
                block.timestamp
            )
        );

        emit ETHSent(to, amount);
    }

    function claimFaucet()
        external
    {
        faucetClaims[msg.sender] += claimReward;

        logs.push(
            LogTransaction(
                address(this),
                msg.sender,
                claimReward,
                "faucet",
                block.timestamp
            )
        );

        emit FaucetClaimed(
            msg.sender,
            claimReward
        );
    }

    function mineReward()
        external
    {
        minerRewards[msg.sender] += claimReward;

        logs.push(
            LogTransaction(
                address(this),
                msg.sender,
                claimReward,
                "miner",
                block.timestamp
            )
        );

        emit MinerReward(
            msg.sender,
            claimReward
        );
    }

    function mintNFT()
        external
    {
        mintedNFT[msg.sender] += 1;

        logs.push(
            LogTransaction(
                address(this),
                msg.sender,
                1,
                "mint",
                block.timestamp
            )
        );

        emit NFTMinted(
            msg.sender,
            1
        );
    }

    function swapToken(
        string memory fromToken,
        string memory toToken,
        uint256 amount
    )
        external
    {
        logs.push(
            LogTransaction(
                msg.sender,
                address(this),
                amount,
                "swap",
                block.timestamp
            )
        );

        emit SwapExecuted(
            msg.sender,
            fromToken,
            toToken,
            amount
        );
    }

    function executeDapp(
        address target,
        uint256 value,
        bytes calldata data
    )
        external
        onlyAuthorized
        returns(bytes memory)
    {
        (
            bool success,
            bytes memory result
        ) = target.call{value:value}(data);

        require(
            success,
            "Execution failed"
        );

        logs.push(
            LogTransaction(
                msg.sender,
                target,
                value,
                "dapp",
                block.timestamp
            )
        );

        return result;
    }

    function authorize(
        address user
    )
        external
        onlyOwner
    {
        authorized[user] = true;
    }

    function revoke(
        address user
    )
        external
        onlyOwner
    {
        authorized[user] = false;
    }

    function changeOwner(
        address newOwner
    )
        external
        onlyOwner
    {
        owner = newOwner;
    }

    function totalLogs()
        external
        view
        returns(uint256)
    {
        return logs.length;
    }

    function systemInfo()
        external
        view
        returns(
            address,
            address,
            address,
            address,
            uint256,
            uint256
        )
    {
        return (
            owner,
            smartWallet,
            accountFactoryV06,
            accountFactoryV07,
            claimReward,
            address(this).balance
        );
    }
}
