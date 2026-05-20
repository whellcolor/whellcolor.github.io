// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @dev Interface standar IERC20 untuk berinteraksi dengan koin/token lain di jaringan Ethereum.
 */
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

/**
 * @title MultiChainWalletTracker
 * @dev Kontrak untuk menerima ETH, mengelola token ERC20, dan menyimpan catatan alamat multi-chain.
 */
contract MultiChainWalletTracker {
    
    address public owner;
    
    // Alamat-alamat Wallet Berdasarkan Data Pengguna
    address public constant ETH_WALLET  = 0x5E8BaDE6E0BcE65807dB6327Cb1D9eEB7c6a6A5b;
    string public constant SOLANA_WALLET = "CB4xnv7Mw23eJkbRBXvbLUDUDQVQsg5AUvfY5nu8Ny5W";
    string public constant BTC_WALLET    = "bc1qfwn7lfntn5jyl9yxgcrnhu4gaz8w5mnua0acyt";
    string public constant DOGE_WALLET   = "DSTbQeqpCajXu8BYmririjJ8b8Lx92Lvov";
    string public constant LTC_WALLET    = "ltc1qz7ccrlkkv5qxrmlenr67jtqe3dy5k5w09sznvf";
    string public constant FIO_WALLET    = "FIO67SRBSYY42urrjvN11AWuuTWHQzo47jH8LE1nrthe48EBxDo9e";
    string public constant ICP_WALLET    = "8a92cb3db92beacc8982e1425c3c25b8f80381249d77ce19bf66c306d8727053";
    string public constant IOTX_WALLET   = "io1p7ej7yufhsc7fwqv5vngde5llse00a4zsrs83w";
    string public constant ZIL_WALLET    = "zil1de4766z0f9mm9psyflk3tcrxc562cw068y863d";
    string public constant EGLD_WALLET   = "erd1rgznaj8fvvy6jq80xyvnzjk0amv5t63l9vm276r0kf939gjy2p0sfakxj8";
    string public constant OSMO_WALLET   = "osmo148ds6u09ywv0d2zswjdcp0h9krs7f8eaf60gw5";
    string public constant FLUX_WALLET   = "t1LKNhr6hitag9QwTk7sGgBnwyyQYxFqMbv";
    string public constant JUNO_WALLET   = "juno148ds6u09ywv0d2zswjdcp0h9krs7f8eahnlrl6";
    string public constant FIRO_WALLET   = "aE7PmZpWuW7aXBqCXhpGmaF2XLSYert4DR";
    string public constant XRP_WALLET    = "rUT9m6CoZqdNWKFm7q2zo8Htsy1cvfSuk";

    // Event untuk log mutasi
    event ReceivedETH(address indexed sender, uint256 amount);
    event WithdrawnETH(address indexed to, uint256 amount);
    event WithdrawnERC20(address indexed token, address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Bukan pemilik kontrak");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Fungsi fallback agar kontrak bisa menerima ETH secara langsung (misal: 0,9 ETH).
     */
    receive() external payable {
        emit ReceivedETH(msg.sender, msg.value);
    }

    fallback() external payable {
        emit ReceivedETH(msg.sender, msg.value);
    }

    /**
     * @dev Mengecek saldo ETH di dalam kontrak ini.
     */
    function getContractETHBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @dev Mengecek saldo token ERC20 milik kontrak ini.
     * @param tokenAddress Alamat smart contract token ERC20 yang ingin dicek.
     */
    function getContractTokenBalance(address tokenAddress) external view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    /**
     * @dev Menarik semua/sebagian ETH yang masuk ke alamat target (ETH_WALLET).
     */
    function withdrawETH(uint256 _amount) external onlyOwner {
        require(_amount <= address(this).balance, "Saldo ETH tidak cukup");
        payable(ETH_WALLET).transfer(_amount);
        emit WithdrawnETH(ETH_WALLET, _amount);
    }

    /**
     * @dev Menarik koin/token ERC20 lainnya yang masuk ke kontrak ini.
     * @param tokenAddress Alamat smart contract token ERC20.
     * @param _amount Jumlah token yang ingin ditarik.
     */
    function withdrawERC20(address tokenAddress, uint256 _amount) external onlyOwner {
        uint256 tokenBalance = IERC20(tokenAddress).balanceOf(address(this));
        require(_amount <= tokenBalance, "Saldo token tidak cukup");
        
        bool success = IERC20(tokenAddress).transfer(ETH_WALLET, _amount);
        require(success, "Transfer token gagal");
        
        emit WithdrawnERC20(tokenAddress, ETH_WALLET, _amount);
    }
}
