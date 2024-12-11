// Allows the user to define an Asset.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DefineAsset { //Defines the asset with all required metadata.
    string public gameTitle;
    int public gameReleaseYear;
    string public gameSystem;
    address public creator; //public variables for the game asset with details of the games title, release year, system release, and address of the creator that deployed it

    event AssetCreated(string title, int releaseYear, string system, address creator); //event to run anytime an asset is created

    constructor(string memory _title, int _releaseYear, string memory _system) {
        gameTitle = _title;
        gameReleaseYear = _releaseYear;
        gameSystem = _system;
        creator = msg.sender;
        emit AssetCreated(_title, _releaseYear, _system, msg.sender);
    } //constructor sets the details of the game and assigns the contract deployer as creator.

    modifier onlyCreator() { //ensures only the contract creator is able to perform certain functions.
        require(msg.sender == creator, "Only the creator can perform this action");
        _;
    }
}
