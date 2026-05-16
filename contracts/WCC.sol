// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0
pragma solidity ^0.8.27;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC1155Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import {ERC1155BurnableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";
import {ERC1155PausableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155PausableUpgradeable.sol";
import {ERC1155SupplyUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/// @custom:security-contact bahansatekambing@gmail.com
contract WCC is Initializable, ERC1155Upgradeable, OwnableUpgradeable, ERC1155PausableUpgradeable, ERC1155BurnableUpgradeable, ERC1155SupplyUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) public initializer {
        __ERC1155_init("https://whellcolor.github.io/");
        __Ownable_init(initialOwner);
        __ERC1155Pausable_init();
        __ERC1155Burnable_init();
        __ERC1155Supply_init();
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155Upgradeable, ERC1155PausableUpgradeable, ERC1155SupplyUpgradeable)
    {
        super._update(from, to, ids, values);
    }
}

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
