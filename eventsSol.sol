// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract EventLog {
    // event declaration
    event Log(address indexed sender, string message, uint id, uint b);
    event Event2();

    function testEventWorking() public{
        emit Log(msg.sender, "Blockchain is awesome",4,6);    // trigger the event
        emit Log(msg.sender,"User created successfully",2,6);
        emit Event2();
    }
}

// topic is the hash of event: to uniquely identify one particular event on the entire blockchain
// event directly updates on blockchain logs, does not need special permission from EVM
// you can evaluate condition on a combination of 3 parameters to filter out event messages
// more than 3 different indexed arguments cannot be used to search on blockchain logs
// pure nor view can be used as you are modifying the blockchain/ printingo on ethereum blockchain
