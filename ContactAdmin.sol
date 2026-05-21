// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ContactAdmin
/// @notice Admin contact & multi-chain wallet registry
/// @dev IERC20 compatible helper

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender,address recipient,uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ContactAdmin {

    string public constant compilerInput = "enabled";

    string[] public metadata = [
        "abi",
        "storageLayout",
        "functionHashes",
        "gasEstimates",
        "devdoc",
        "userdoc",
        "Assembly"
    ];

    // ===== EVM =====
    address public constant eth =
        0x5E8BaDE6E0BCe65807db6327Cb1D9EEb7C6A6A5B;

    // ===== Non-EVM Wallets =====
    string public constant solana =
        "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W";

    string public constant btc =
        "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt";

    string public constant doge =
        "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov";

    string public constant ltc =
        "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf";

    string public constant fio =
        "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e";

    string public constant icp =
        "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053";

    string public constant iotx =
        "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w";

    string public constant zil =
        "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d";

    string public constant egld =
        "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8";

    string public constant osmo =
        "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5";

    string public constant flux =
        "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv";

    string public constant juno =
        "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6";

    string public constant firo =
        "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR";

    string public constant xrp =
        "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk";

    function getAllMetadata() external view returns (string[] memory) {
        return metadata;
    }
}
