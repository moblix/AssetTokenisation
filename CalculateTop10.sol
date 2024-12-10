//Allows to calculate the owners of the assets and work out the top 10 beneficiaries
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol";

contract CalculateTop10 is TokeniseAsset {

    
    function getTopOwners() public view returns (address[] memory) {
        address;
        
        return topOwners;
    }

    function getOwnerOfAsset(address owner) public view returns (address, uint256) {
        return (owner, balanceOf[owner]);
    }
}
