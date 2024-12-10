// Purchase, transfer and sell the asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol";

contract AssetTransactions is TokeniseAsset {
    uint256 public assetPrice;
    mapping(address => uint256) public purchaseHistory;

    event AssetPurchased(address indexed buyer, uint256 amount);
    event AssetSold(address indexed seller, uint256 amount);

    constructor(string memory _title, int _releaseYear, string memory _system, uint256 _initialPrice)
        TokeniseAsset(_title, _releaseYear, _system) {
        assetPrice = _initialPrice;
    }

    function purchaseAsset(uint256 amount) public payable {
        require(msg.value == assetPrice * amount, "Incorrect ETH sent");
        mint(msg.sender, amount);
        purchaseHistory[msg.sender] += amount;
        emit AssetPurchased(msg.sender, amount);
    }

    function sellAsset(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance to sell");
        uint256 valueToTransfer = assetPrice * amount;
        payable(msg.sender).transfer(valueToTransfer);
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit AssetSold(msg.sender, amount);
    }

    function setAssetPrice(uint256 _newPrice) public onlyCreator {
        assetPrice = _newPrice;
    }
}
