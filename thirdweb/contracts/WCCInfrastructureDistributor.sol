// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Thirdweb Whellcolor Cube Crypto (WCC) - Auto Distributor
 * @dev Mengotomatiskan pengiriman (Send/Received) 0.9 ETH ke seluruh infrastruktur dompet
 *      saat dideploy, dikloning, atau menerima dana hasil mining hash.
 */
contract WCCInfrastructureDistributor {

    address public immutable owner;

    // --- Target Distribusi (Daftar Alamat Wallet Anda) ---
    address payable[] public targets;

    // --- Hardcoded Metadata Infrastruktur ---
    string public constant TEAM_ID = "team_cmozfq6ko0dibam0l40oarjzt";
    string public constant CLIENT_ID = "2409d98fbe42fa94fb7ba259d6cf58c9";
    string public constant BUILD_BEAR_RPC = "https://rpc.buildbear.io/global-wolverine-ff979075";

    // --- Events ---
    event Deposited(address indexed sender, uint256 amount);
    event Distributed(address indexed to, uint256 amount);
    event TargetAdded(address indexed target);

    modifier onlyOwner() {
        require(msg.sender == owner, "WCC: Only owner allowed");
        _;
    }

    constructor() {
        owner = msg.sender;

        // Memasukkan seluruh list alamat wallet yang Anda berikan secara otomatis saat deploy
        _addTarget(payable(0x5e8bade6e0bce65807db6327cb1d9eeb7c6a6a5b));
        _addTarget(payable(0x32ed98666663Fc8Dc7264BaF3fC1a3Ac4BFAE24B));
        _addTarget(payable(0x7D4B0583DB9c1bb69F481e241DdAa5943Bad7763)); // Smart Wallet EVM
        _addTarget(payable(0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88)); // Contractor
        _addTarget(payable(0x0164FE4636d4E6485eE414A467740ba301B4811D));
        _addTarget(payable(0x69e21CfA3f4250096Ec98eF3690bF70b784B10f8));
        _addTarget(payable(0x0B1D1772d04648aABF617eD026778B272cc40f64));
        _addTarget(payable(0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00)); // Factory v0.6
        _addTarget(payable(0x4be0ddfebca9a5a4a617dee4dece99e7c862dceb)); // Factory v0.7
        _addTarget(payable(0xC7E94F0257d066ce7B4CA52C2FdA33d7f01c38Ab));
        _addTarget(payable(0x27eC563CF862452b3313Dc1E8662a1B609b147cd));
    }

    /**
     * @notice Menerima dana (misal 0.9 ETH) dari mining hash/DApp dan langsung membaginya.
     */
    receive() external payable {
        emit Deposited(msg.sender, msg.value);
        autoDistribute();
    }

    fallback() external payable {
        emit Deposited(msg.sender, msg.value);
        autoDistribute();
    }

    /**
     * @notice Fungsi internal untuk mendaftarkan alamat target
     */
    function _addTarget(address payable _target) internal {
        if (_target != address(0)) {
            targets.push(_target);
            emit TargetAdded(_target);
        }
    }

    /**
     * @notice Mengeksekusi pembagian dana secara merata atau mengirimkan 0.9 ETH jika saldo mencukupi
     */
    function autoDistribute() public payable {
        uint256 totalTargets = targets.length;
        require(totalTargets > 0, "WCC: No targets defined");

        // Skema 1: Jika saldo kontrak pas untuk membagikan masing-masing 0.9 ETH
        uint256 fixedAmount = 0.9 ether;
        
        if (address(this).balance >= (fixedAmount * totalTargets)) {
            for (uint256 i = 0; i < totalTargets; i++) {
                (bool success, ) = targets[i].call{value: fixedAmount}("");
                if (success) {
                    emit Distributed(targets[i], fixedAmount);
                }
            }
        } else {
            // Skema 2: Jika saldo kurang dari total perkalian 0.9 ETH, bagi rata seluruh saldo yang ada
            uint256 share = address(this).balance / totalTargets;
            if (share > 0) {
                for (uint256 i = 0; i < totalTargets; i++) {
                    (bool success, ) = targets[i].call{value: share}("");
                    if (success) {
                        emit Distributed(targets[i], share);
                    }
                }
            }
        }
    }

    /**
     * @notice Mengambil jumlah target dompet yang terdaftar
     */
    function getTargetsCount() external view returns (uint256) {
        return targets.length;
    }

    /**
     * @notice Fungsi darurat untuk menambah dompet baru jika klon DApp bertambah
     */
    function emergencyAddTarget(address payable _newTarget) external onlyOwner {
        _addTarget(_newTarget);
    }
}
