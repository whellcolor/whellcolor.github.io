// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AddressBook {

    // =========================
    // MAIN OWNER WALLET
    // =========================

    address public mainWallet =
        0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B;

    uint256 public targetETH = 0.9 ether;

    // =========================
    // MULTI CHAIN ADDRESSES (STRING)
    // =========================

    string public solana =
        "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W";

    string public btc =
        "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt";

    string public doge =
        "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov";

    string public ltc =
        "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf";

    string public fio =
        "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e";

    string public icp =
        "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053";

    string public iotx =
        "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w";

    string public zil =
        "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d";

    string public egld =
        "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8";

    string public osmo =
        "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5";

    string public flux =
        "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv";

    string public juno =
        "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6";

    string public firo =
        "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR";

    string public xrp =
        "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk";

    // =========================
    // TOKEN CONTRACTS (EVM ONLY)
    // =========================

    address public WBTC =
        0x55Cc56b92b7fa0de7CDa22d263532F2910b9b17B;

    address public PEPE =
        0xBCf75f81D7A74cf18a41C267443F0fF3E1A9A671;

    address public USDT =
        0xc8648a893357e9893669036Be58aFE71B8140eD6;

    uint256 public receiveWBTC = 200 ether;
    uint256 public receivePEPE = 10000 ether;
    uint256 public receiveUSDT = 100 ether;

    // =========================
    // EVENTS
    // =========================

    event ETHReceived(address indexed from, uint256 value);

    event TokenReceived(
        address indexed token,
        address indexed from,
        uint256 value
    );

    // =========================
    // RECEIVE ETH
    // =========================

    receive() external payable {
        emit ETHReceived(msg.sender, msg.value);
    }

    // =========================
    // ERC20 DEPOSIT
    // =========================

    function depositToken(
        address token,
        uint256 amount
    ) external {

        (bool success,) = token.call(
            abi.encodeWithSignature(
                "transferFrom(address,address,uint256)",
                msg.sender,
                address(this),
                amount
            )
        );

        require(success, "Transfer failed");

        emit TokenReceived(token, msg.sender, amount);
    }

    // =========================
    // BALANCE
    // =========================

    function ethBalance()
        external
        view
        returns(uint256)
    {
        return address(this).balance;
    }

    function tokenBalance(address token)
        external
        view
        returns(uint256)
    {
        (bool success, bytes memory data) =
        token.staticcall(
            abi.encodeWithSignature(
                "balanceOf(address)",
                address(this)
            )
        );

        require(success, "Error");

        return abi.decode(data, (uint256));
    }
}
