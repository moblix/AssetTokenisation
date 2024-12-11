// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol"; //inherits functions

contract CalculateTop10 is TokeniseAsset { 

    
    constructor(string memory _title, int _releaseYear, string memory _system)
        TokeniseAsset(_title, _releaseYear, _system) {}

    // picks up the top 10 holders
    function getTopOwners() public view returns (address[] memory) {
        uint256 topLimit = 10;
        address[] memory topOwners = new address[](topLimit);

        uint256 maxBalance = 0; //tracks maximum balance
        uint256 index = 0;

        
        for (uint256 i = 1; i <= topLimit; i++) {
            address owner = address(uint160(i));  //generates the address

            if (balanceOf[owner] > maxBalance) {
                maxBalance = balanceOf[owner];
                topOwners[index] = owner; //adds the address  to array of top owners
                index++;
                if (index == topLimit) break;
            }
        }

        return topOwners; //displays top owners
    }

    
    function getOwnerOfAsset(address owner) public view returns (address, uint256) {
        return (owner, balanceOf[owner]);
    }
}
