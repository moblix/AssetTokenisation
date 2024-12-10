// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol";

contract CalculateDifferentAssets is TokeniseAsset {

    
    constructor(string memory _title, int _releaseYear, string memory _system)
        TokeniseAsset(_title, _releaseYear, _system) {}

    
    function totalAssetsCreated() public view returns (uint256) {
        return totalSupply; // totalSupply is inherited from TokeniseAsset
    }

    // this shows balance of a specific owner
    function getOwnerBalance(address owner) public view returns (uint256) {
        return balanceOf[owner]; 
    }
}
