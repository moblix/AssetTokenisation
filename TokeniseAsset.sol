// Tokenise the asset by creation of the native tokens representing a fractional share of the asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "./DefineAsset.sol";

contract TokeniseAsset is DefineAsset {
    string public name = "Smashbros";
    string public symbol = "SMB";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _title, int _releaseYear, string memory _system) DefineAsset(_title, _releaseYear, _system) {}

    function mint(address to, uint256 amount) public onlyCreator {
        require(to != address(0), "Cannot mint to the zero address");
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
}
