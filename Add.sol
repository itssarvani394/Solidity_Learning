// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

// Deploying this function doesn't work
// An abstract contract cannot be deployed -> make another contract that extends the abstract contract and define all the methods
abstract contract CalcTemplate {
    function op() public virtual returns(uint); // abstract function: function only declared -> must be marked virtual
    // contract becomes abstract even if abstract method/function

    // abstract contract can have other defined functions as well
    function getValue() public pure returns(uint) {
        return 1;
    }
}


// Deploying this function doesn't work
// for contract having only abstract functions -> can use interface
/* interface CalcTemplate {
    function op() external returns(uint);
} */


// Inheritance
// only this contract is deployed and not the abstract or interface contract
contract Add is CalcTemplate {
    uint public num1;
    uint public num2;

    // override is optional in terms of interface from 0.8.8 but compulsary in terms of abstract contract for any version
    function op() public view override returns(uint) {
        return num1 + num2;
    }
}
