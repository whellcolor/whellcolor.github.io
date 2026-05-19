// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ERC1155Token {

    mapping(uint256 => mapping(address => uint256)) public balanceOf;
    mapping(address => mapping(address => bool)) public approval;

    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function setApprovalForAll(address operator, bool approved) public {
        approval[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        return approval[owner][operator];
    }

    function balanceOfToken(address account, uint256 id) public view returns (uint256) {
        return balanceOf[id][account];
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount) public {
        require(from == msg.sender || approval[from][msg.sender], "Not approved");
        require(balanceOf[id][from] >= amount, "Low balance");

        balanceOf[id][from] -= amount;
        balanceOf[id][to] += amount;

        emit TransferSingle(msg.sender, from, to, id, amount);
    }

    function mint(address to, uint256 id, uint256 amount) public {
        balanceOf[id][to] += amount;

        emit TransferSingle(msg.sender, address(0), to, id, amount);
    }

    function burn(address from, uint256 id, uint256 amount) public {
        require(balanceOf[id][from] >= amount, "Low balance");

        balanceOf[id][from] -= amount;

        emit TransferSingle(msg.sender, from, address(0), id, amount);
    }
}
