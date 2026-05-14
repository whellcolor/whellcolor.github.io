// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0
pragma solidity ^0.8.27;

import {AccountERC7579HookedUpgradeable} from "@openzeppelin/contracts-upgradeable/account/extensions/draft-AccountERC7579HookedUpgradeable.sol";
import {AccountERC7579Upgradeable} from "@openzeppelin/contracts-upgradeable/account/extensions/draft-AccountERC7579Upgradeable.sol";
import {MultiSignerERC7913Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/signers/MultiSignerERC7913Upgradeable.sol";
import {Account} from "@openzeppelin/contracts/account/Account.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/draft-IERC4337.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import {ERC1155Holder} from "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {ERC7739} from "@openzeppelin/contracts/utils/cryptography/signers/draft-ERC7739.sol";

/// @custom:security-contact bahansatekambing@gmail.com
contract DappMiner is Initializable, Account, EIP712, ERC7739, AccountERC7579HookedUpgradeable, MultiSignerERC7913Upgradeable, ERC721Holder, ERC1155Holder {
    /// @custom:oz-upgrades-unsafe-allow-reachable constructor
    constructor() EIP712("DappMiner", "1") {
        _disableInitializers();
    }

    function initialize(bytes[] memory signers, uint64 threshold)
        public
        initializer
    {
        __AccountERC7579Hooked_init();
        __MultiSignerERC7913_init(signers, threshold);
    }

    function isValidSignature(bytes32 hash, bytes calldata signature)
        public
        view
        override(AccountERC7579Upgradeable, ERC7739)
        returns (bytes4)
    {
        // ERC-7739 can return the ERC-1271 magic value, 0xffffffff (invalid) or 0x77390001 (detection).
        // If the returned value is 0xffffffff, fallback to ERC-7579 validation.
        bytes4 erc7739magic = ERC7739.isValidSignature(hash, signature);
        return erc7739magic == bytes4(0xffffffff) ? AccountERC7579Upgradeable.isValidSignature(hash, signature) : erc7739magic;
    }

    function addSigners(bytes[] memory signers) public onlyEntryPointOrSelf {
        _addSigners(signers);
    }

    function removeSigners(bytes[] memory signers) public onlyEntryPointOrSelf {
        _removeSigners(signers);
    }

    function setThreshold(uint64 threshold) public onlyEntryPointOrSelf {
        _setThreshold(threshold);
    }

    // The following functions are overrides required by Solidity.

    function _validateUserOp(PackedUserOperation calldata userOp, bytes32 userOpHash, bytes calldata signature)
        internal
        override(Account, AccountERC7579Upgradeable)
        returns (uint256)
    {
        return super._validateUserOp(userOp, userOpHash, signature);
    }

    // IMPORTANT: Make sure MultiSignerERC7913Upgradeable is more derived than AccountERC7579Upgradeable
    // in the inheritance chain (i.e. contract ... is AccountERC7579Upgradeable, ..., MultiSignerERC7913Upgradeable)
    // to ensure the correct order of function resolution.
    // AccountERC7579Upgradeable returns false for _rawSignatureValidation
    function _rawSignatureValidation(bytes32 hash, bytes calldata signature)
        internal
        view
        override(MultiSignerERC7913Upgradeable, AbstractSigner, AccountERC7579Upgradeable)
        returns (bool)
    {
        return super._rawSignatureValidation(hash, signature);
    }
}
