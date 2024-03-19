// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract  Account {
    // initially all balances are 0
    mapping(address => uint) balance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint amt) public {
        require(msg.sender == owner,"Stay in ypur limit");

        uint a = 4;
        uint b = 5;
        uint c = a + a;

        // checking for mistakes / or any errors in code -> internal checking
        assert(c == 9);

        balance[msg.sender] += amt + c;
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(address to, uint amount) public {
        /* if(balance[msg.sender] < amount)
            revert("You don't have enough balance"); */

        // Only if this is true, you can move forward; same functionality as above; for external checking
        require(balance[msg.sender]>amount,"Insuffient balance");
        
        // can give multiple requires

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
}

// require -> remaining gas will be returned to the user
// assert -> consumes the entire gas