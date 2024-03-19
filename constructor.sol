// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract A {
    uint public num;

    // parametrised constructor
    // parameters are asked during deployement only once
    
    // constructor(uint _num) public {
    //     num = _num;
    // } 

    constructor() {
        num = 10;
    }    

    // modifier
    modifier check(uint _num) {
        if(_num>=5) {
            _;
        }
    }

    function update(uint _num) public check(_num) returns(uint){ 
            num = num + _num;
            return num;
    }
}

/* contract B is A {
    // child class also has the same constructor
    constructor(uint _num) public {
        num = _num;
    }
} */