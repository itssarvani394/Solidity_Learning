// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract SendingFunds {
    function sendEtherTransfer(address payable _to) public payable {
        // this is not recommended
        _to.transfer(msg.value);    // 2300 gas limit
    }

    function sendEtherSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);    // 2300 gas limit forthe .send method
        require(sent,"Failed to send ether");
    }

    function sendEtherCall(address payable _to) public payable {
        (bool sent,)=_to.call{gas:1000,value:msg.value}("");
        require(sent,"Failed to send Ether");
    }
}