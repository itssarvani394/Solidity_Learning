// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Token {
    string public name = "Sarvani Token";
    string public symbol = "INT";

    uint public TotalSupply = 1000;

    address public owner;

    mapping(address => uint) balance;

    constructor() {
        owner = msg.sender;
        balance[owner] = 1000;
    }

    function transfer(address to, uint amt) external {
        balance[msg.sender] -= amt;
        balance[to] += amt;
    }

    function getBalance(address acc) external view returns(uint) {
        return balance[acc];
    }
}
