// Tokenise the asset by creation of the native tokens representing a fractional share of the asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "./DefineAsset.sol";//imports so this contract inherits properties and functions from the define asset contract


contract TokeniseAsset is DefineAsset { 
    string public name = "smashbros";
    string public symbol = "SMB";
    uint8 public decimals = 1;
    uint256 public totalSupply; //metadata to apply to the token itself

    mapping(address => uint256) public balanceOf; //maps the address to token balances
    mapping(address => mapping(address => uint256)) public allowance;
    address[] public AddressList;


    event Transfer(address indexed from, address indexed to, uint256 value); //event wehn token is transfered
    event Approval(address indexed owner, address indexed spender, uint256 value); //event when token allowance approved

    constructor(string memory _title, int _releaseYear, string memory _system) DefineAsset(_title, _releaseYear, _system) {}//inherit from defineasset.sol

    function mint(address to, uint256 amount) public onlyCreator {
        require(to != address(0), "Cannot mint to the zero address");
        totalSupply += amount; //increases overall supply of the tokens
        balanceOf[to] += amount; //increments the recievers balance
        AddressList.push(to);
        emit Transfer(address(0), to, amount);
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance"); //cancels if the sender doesnt have enough tokens
        balanceOf[msg.sender] -= amount; 
        balanceOf[recipient] += amount; //deducts from sender and then adds to recievers balance
        AddressList.push(recipient);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    


}
 
