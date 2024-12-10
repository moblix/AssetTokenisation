//Allows to calculate how many assets have been created.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol";

contract CalculateDifferentAssets is TokeniseAsset {

    function totalAssetsCreated() public view returns (uint256) {
        return totalSupply;
    }

    function getOwnerBalance(address owner) public view returns (uint256) {
        return balanceOf[owner];
    }
}
