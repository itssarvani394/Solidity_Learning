// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract DataLocations {
    string AccountName = "Ineuron";
    // string newVariable1 = "hello1";
    // string newVariable2 = "hello2";
    // string newVariable3 = "hello3";
    // string newVariable4 = "hello4";

    function displayAccName() public view returns(string memory) {
        // string memory newVariable;
        // string memory newVariable1;
        // string memory newVariable2;
        // string memory newVariable3;
        // string memory newVariable4;
        // return AccountName;
    }

    function result(string calldata _a) public pure returns(string calldata) {
        // _a = "hello1";
        // calldata can only be returned
        return _a;
    }

    function result2(string memory _b) public pure returns(string memory) {
        _b  = "hello2";
        return _b;
    }

    
}

// state variables -> storage
// local variables -> storage
// gas for memory, calldata & storage function 
// check for all different gas costs for structs
// detailed gas cost analysis for all the three data locations