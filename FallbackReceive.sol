// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

contract FallbackReceive {
    string public called = "";
    uint public amount = 0;             // Ethers received
    bytes public data;

    // If not function payable(to receive ethers) is available, then you receive function
    // A contract can receive money with the help of receive function
    // default execution is receive function but incase the function does not match, fallback is executed
    // msg.data cannot be used inside receive function
    receive() external payable{
        called = "receive";
        amount = msg.value;
    }

    // executes when no other function is matching
    fallback() external payable{
        called =  "fallback";
        amount = msg.value;
        data = msg.data;
    }
}
