// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

// Delete an element at a particular index
library RemoveIndex{
    // Libraries don't use state variables
    function remove(uint[] storage arr, uint index) public {
        require(arr.length>0,"Cant remove from empty array");
        arr[index]=arr[arr.length-1];
        arr.pop();
    }
}

// Dont have to import library as it is in the same solidity file; can be directly available to SC
// Storing part has to be deone by the Smart Contract
contract TestArray{
    uint[] public arr;

    using RemoveIndex for uint[];       // use the structure & functions of the library for any variable in the array format; can be used as a method for an array
    function testArrayRemoval() public returns(uint[] memory){
        for(uint i=0;i<4;i++) {
            arr.push(i);
        }
        // Mention the index to be removed
        arr.remove(2);
        return(arr);
    }
}