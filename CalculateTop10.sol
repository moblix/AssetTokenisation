// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./TokeniseAsset.sol"; //inherits functions

contract CalculateTop10 is TokeniseAsset { 
    address[] public top10;

    
    constructor(string memory _title, int _releaseYear, string memory _system)
        TokeniseAsset(_title, _releaseYear, _system) {}

    // picks up the top 10 holders
    function getTopOwners() public view returns (address[] memory) {
        //uint256 topLimit = 2;
        address[] memory topOwners;

        uint256 maxBalance = 0; //tracks maximum balance
        uint256 index = 0;

        
        for(uint256 i = 0; i < AddressList.length; i++) {

                if (balanceOf[AddressList[i]] > maxBalance) {
                    maxBalance = balanceOf[AddressList[i]];
                    topOwners[index] = AddressList[i]; //adds the address  to array of top owners
                    index++;
                    //if (index == topLimit) break;
                }
            }

        return topOwners; //displays top owners
    }

    
    function getOwnerOfAsset(address owner) public view returns (address, uint256) {
        return (owner, balanceOf[owner]);
    }

    function sortByBalance() public view returns(address[] memory)
    {
        address[] memory addrArray = AddressList;
        
        for(uint256 i=0;i<addrArray.length-1;i++){
            uint256 j=i+1;
            while(j < addrArray.length) {
                if (balanceOf[addrArray[j]] > balanceOf[addrArray[i]]) {

                // Swap elements
                    address temp = addrArray[i];
                    addrArray[i] = addrArray[j]; 
                    addrArray[j]=temp;

                j++;
                }
            }

            return(addrArray);
        }
    }
}
