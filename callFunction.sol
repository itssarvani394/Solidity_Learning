// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract CallContract {
    string public Str = "Blockchain";

    // if 1 ether is sent in msg.value, then update the string
    function updateString(string memory _newString) public payable returns(uint,uint) {
        uint startGas1 = gasleft();         // latest current gas balance
        require(msg.value==1 ether);

        Str=_newString;
        address payable owner = payable(msg.sender);

        // fallback function is used to receive ethers
        (bool success,)=owner.call{value:msg.value}("");
        require(success,"Failure");
        return(startGas1,startGas1-gasleft());
    }
}

// Gas
//1. Declaring Function
//2. Executing smart contracts
//3. Gas for all the step in between(difference is the gas consumed)

// Enable Optimiztion(takes the average) to reduce gas cost(to save atleat 30% of the gas; Eg:200 runs)
// optimization only upto a certain number of optimal times
// As soon as you get the optimized version, save the ABI & Bytecode somewhere else
// Gas after optimization 356195; 43481-21005 = 22476(base gas)
