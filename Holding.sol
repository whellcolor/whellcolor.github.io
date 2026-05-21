// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Holding
/// @notice Simple multi-chain holding wallet registry

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Holding {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // ===== Supported Chains =====

    address public constant ETH =
        0x5E8BaDE6E0BCe65807db6327Cb1D9EEb7C6A6A5B;

    string public constant SOLANA =
        "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W";

    string public constant BTC =
        "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt";

    string public constant DOGE =
        "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov";

    string public constant LTC =
        "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf";

    string public constant FIO =
        "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e";

    string public constant ICP =
        "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053";

    string public constant IOTX =
        "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w";

    string public constant ZIL =
        "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d";

    string public constant EGLD =
        "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8";

    string public constant OSMO =
        "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5";

    string public constant FLUX =
        "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv";

    string public constant JUNO =
        "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6";

    string public constant FIRO =
        "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR";

    string public constant XRP =
        "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk";

    // ===== ERC20 Rescue =====

    function withdrawToken(
        address token,
        uint256 amount
    ) external onlyOwner {
        IERC20(token).transfer(owner, amount);
    }

    // ===== Native ETH Rescue =====

    function withdrawETH(uint256 amount) external onlyOwner {
        payable(owner).transfer(amount);
    }

    receive() external payable {}

    // ===== Metadata =====

    function compilerInput() external pure returns (string memory) {
        return "solc 0.8.20";
    }

    function metadata()
        external
        pure
        returns (string[] memory data)
    {
        data = new string[](7);

        data[0] = "abi";
        data[1] = "storageLayout";
        data[2] = "functionHashes";
        data[3] = "gasEstimates";
        data[4] = "devdoc";
        data[5] = "userdoc";
        data[6] = "Assembly";
    }
}
