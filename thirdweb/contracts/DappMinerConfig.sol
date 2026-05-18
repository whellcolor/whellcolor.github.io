// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Thirdweb Whellcolor Cube Crypto (WCC) - Configuration & Infrastructure Control
 * @dev Mengunci konfigurasi infrastruktur Thirdweb, Smart Wallet factories, dan wallet contractor.
 */
contract DappMinerConfig {
    
    // --- State Variables (Data Infrastruktur) ---
    string public constant TEAM_ID = "team_cmozfq6ko0dibam0l40oarjzt";
    string public constant CLIENT_ID_1 = "2409d98fbe42fa94fb7ba259d6cf58c9";
    string public constant CLIENT_ID_2 = "3ea7634968af4a7c90b17914bcf7d4bb";
    string public constant CLIENT_ID_3 = "e6230839e78c90a670b64b1f26c0b3d8";
    
    // API Keys & String Hash Data
    string public constant ETH_API_KEY = "8WRIDBMW18HXAB44ATGX7IPYGSHXVXDVC3";
    string public constant BUILD_BEAR_RPC = "https://rpc.buildbear.io/global-wolverine-ff979075";
    string public constant THIRDWEB_RPC = "https://1.rpc.thirdweb.com/3ea7634968af4a7c90b17914bcf7d4bb";
    string public constant SECURE_HASH_DATA = "-mo2kL01Syg12xzGeqFXFP_GDqg9Pt08hYCsIp0TOWmuOtedh-1rJUTJJW-2K24ZWyIkXWupLQW2Yvb-iTu0TA";

    // --- Core Architecture Wallets & Factories ---
    address public immutable owner;
    address public walletServer = 0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B;
    address public walletEVM = 0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B;
    address public smartWalletEVM = 0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763;
    
    // Target Utama Pengiriman Dana / Dukungan
    address payable public contractorAddress = payable(0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88);

    // Account Factories (v0.6 & v0.7 ERC-4337)
    address public constant ACCOUNT_FACTORY_V06 = 0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00;
    address public constant ACCOUNT_FACTORY_V07 = 0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb;

    // Additional Validated Infrastructure Nodes
    address public nodeAddress1 = 0x5F4D8e0d0A5f0Ca204a88B1e40e16e8E5Ab016Ec;
    address public nodeAddress2 = 0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B;
    address public nodeAddress3 = 0x171b9f078bc82f8be12c94a4de09cbe3051b1ea7;

    // --- Events ---
    event WalletServerUpdated(address indexed oldServer, address indexed newServer);
    event ContractorUpdated(address indexed oldContractor, address indexed newContractor);
    event FundsForwarded(address indexed to, uint256 amount);
    event Received(address indexed sender, uint256 amount);

    // --- Modifiers ---
    modifier onlyOwner() {
        require(msg.sender == owner, "WCC: Only Owner allowed");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Menerima dana langsung (Dukungan ETH/Native Token) dari DApp Faucet/Miner.
     */
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    // --- Governance & Update Functions ---

    function updateWalletServer(address _newServer) external onlyOwner {
        require(_newServer != address(0), "WCC: Invalid address");
        emit WalletServerUpdated(walletServer, _newServer);
        walletServer = _newServer;
    }

    function updateContractorAddress(address payable _newContractor) external onlyOwner {
        require(_newContractor != address(0), "WCC: Invalid address");
        emit ContractorUpdated(contractorAddress, _newContractor);
        contractorAddress = _newContractor;
    }

    /**
     * @notice Menarik atau meneruskan native token (ETH) dari smart contract ke alamat contractor.
     */
    function withdrawFunds() external {
        uint256 balance = address(this).balance;
        require(balance > 0, "WCC: No balance to withdraw");
        
        (bool success, ) = contractorAddress.call{value: balance}("");
        require(success, "WCC: Transfer to contractor failed");
        
        emit FundsForwarded(contractorAddress, balance);
    }

    /**
     * @notice Fungsi helper untuk membaca status kecocokan Account Factory
     */
    function getFactoryInfo(uint8 version) external pure returns (address factory, string memory entrypoint) {
        if (version == 6) {
            return (ACCOUNT_FACTORY_V06, "0.6");
        } else if (version == 7) {
            return (ACCOUNT_FACTORY_V07, "0.7");
        } else {
            revert("WCC: Factory version not supported");
        }
    }
}
