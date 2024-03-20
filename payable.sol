// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Payable {
    // payable address can send and receive address
    address payable public owner;

    // payable constructor can receive ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // this function can receive ether 
    // send money inside the smart contract
    function deposit() public payable{}

    // this cannot accept ethers
    function nonPayable() public{}


    // .call is an inbuilt function & is used to send ethers; others: .send, .transfer
    // withdraws all the balance in the smart contract to the owner account
    function withdraw() public {
        uint amount = address(this).balance;    // points to current samrt contract and calculates the balance 
        (bool success,)=owner.call{value:amount}("Amount withdrawn from smart contract");

        require(success,"Failed to receive ether");
    }     

    // revert transaction if amount transferring is more than smart contract amount; deducted from smart contracts
    function transfer(address payable _to,uint _amount) public {
        //(bool success,) = _to.call{value:_amount}("Ether Transferred");
        (bool success,) = _to.call{value:_amount*(10**18)}("Ether Transferred");        // to deduct in ethers and not in wei
        require(success,"Failed to send ether to address");
    }
}

// parameters & calldata are converted to send to EVM
//0x00000000000000000000000078731d3ca6b7e34ac0f824c42a7cc18a495cabab00000000000000000000000000000000000000000000000000000000000186a0
//0xa9059cbb00000000000000000000000078731d3ca6b7e34ac0f824c42a7cc18a495cabab00000000000000000000000000000000000000000000000000000000000186a0