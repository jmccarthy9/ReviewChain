// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract hashTracker {
    string public currentHash;
    address public owner;

    // sets contract deployer as owner
    constructor() {
        owner = msg.sender;
    }

    // updates the hash that's stored on chain
    function updateHash(string memory _currentHash) public onlyOwner {
        currentHash = _currentHash;
    }

    // view function, returns the current hash
    function getCurrentHash() public view returns(string memory){
        return currentHash;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not authorized to update the hash");
        _;
    }

}
