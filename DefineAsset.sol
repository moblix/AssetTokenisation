// Allows the user to define an Asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DefineAsset {
    string public gameTitle;
    int public gameReleaseYear;
    string public gameSystem;
    address public creator;
        
    event AssetCreated(string title, int releaseYear, string system, address creator);

    constructor(string memory _title, int _releaseYear, string memory _system) {
        gameTitle = _title;
        gameReleaseYear = _releaseYear;
        gameSystem = _system;
        creator = msg.sender;
        emit AssetCreated(_title, _releaseYear, _system, msg.sender);
    }

    modifier onlyCreator() {
        require(msg.sender == creator, "Only the creator can perform this action");
        _;
    }
}
