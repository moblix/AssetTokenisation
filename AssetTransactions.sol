// Purchase, transfer and sell the asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol"; //inherits features again, this time from tokenise asset

contract AssetTransactions is TokeniseAsset {

    uint256 public assetPrice; //price measured in wei
    mapping(address => uint256) public purchaseHistory; //tracks buyer

    event AssetPurchased(address indexed buyer, uint256 amount); //event for a buyer buying
    event AssetSold(address indexed seller, uint256 amount); //and one for a seller selling

    constructor(string memory _title, int _releaseYear, string memory _system, uint256 _initialPrice) TokeniseAsset(_title, _releaseYear, _system) {
        assetPrice = _initialPrice; //sets starting price
    }

    function purchaseAsset(uint256 amount) public payable {
        require(msg.value == assetPrice * amount, "Incorrect ETH sent"); //stops if incorrect eth is recieved
        mint(msg.sender, amount); //mints number of tokens to buyer
        purchaseHistory[msg.sender] += amount; //updates the purchase history
        emit AssetPurchased(msg.sender, amount);
    }

    function sellAsset(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance to sell"); //checks for correct number of tokens
        uint256 valueToTransfer = assetPrice * amount; //decides eth value to send to seller
        payable(msg.sender).transfer(valueToTransfer); //sends to the seller
        balanceOf[msg.sender] -= amount; //takes away the number of tokens from them
        totalSupply -= amount; //decreases overall supply
        emit AssetSold(msg.sender, amount);
    }

    function setAssetPrice(uint256 _newPrice) public onlyCreator {
        assetPrice = _newPrice; //updates price
    }
}
