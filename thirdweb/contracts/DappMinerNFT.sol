// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DappMinerNFT {
    string public name = "DappMiner NFT";
    string public symbol = "DMN";

    address public owner;
    uint256 public totalSupply;

    struct NFT {
        string tokenURI;
        address owner;
    }

    mapping(uint256 => NFT) public nfts;

    event Minted(
        uint256 indexed tokenId,
        address indexed to,
        string tokenURI
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address defaultAdmin) {
        owner = defaultAdmin;
    }

    function mint(
        address to,
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        totalSupply++;

        uint256 tokenId = totalSupply;

        nfts[tokenId] = NFT({
            tokenURI: tokenURI,
            owner: to
        });

        emit Minted(tokenId, to, tokenURI);

        return tokenId;
    }

    function tokenURI(
        uint256 tokenId
    ) public view returns (string memory) {
        return nfts[tokenId].tokenURI;
    }

    function ownerOf(
        uint256 tokenId
    ) public view returns (address) {
        return nfts[tokenId].owner;
    }
}
