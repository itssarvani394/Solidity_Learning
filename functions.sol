// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Function {
    // cannot change the value, nor the order, nor the indexes of variables

    function returnMultiple() public pure returns(uint,bool,uint) {
        // default values are taken into account
        (5,true,57);
    }

    function returnNamed() public pure returns(uint x,bool b, int y) {
        return(1,true,-5);
    }

    function AssignValues() public pure returns(uint x, bool b, int y) {
        x=50;
        b=false;
        y=-20;
        return(x,b,y);
    }

    function destructuring() public pure returns(uint,bool,uint,uint,uint) {
        (uint i, bool b, uint j) = returnMultiple();
        i=300;
        (uint x,uint m,uint y)=(10,15,20);

        return(i,b,j,x,y);
    }
}

contract SecondFunction {
    // function SecondFunctionContract(uint x,uint y, uint z, address a,bool b,string memory c) public pure returns(address,bool) {
    //     return(address(0),true);
    // }
    
    //external allows a function to be called by an external smart contract
    // msg.sender is a state function
    // msg.sender is the address who is trying to execute functionality from contract; addressof sender who is calling smart contract
    
    // function callFunction() external view returns(uint){
    //     return SecondFunctionContract(1,2,3,msg.sender,true,"Blockchain");
    // }

    // function callFunction() external view returns(address){
    //      return (msg.sender);
    // }

    // address
    function SecondFunctionContract(address a,bool b) public pure returns(address,bool) {
        // return(address(0),true);
        return(a,b);
    }

    // address(0) is an empty address -> genesis block address
    // address(0) is used to represent the owner of smart contract
    // special smart contracts that are funded
    function callFunction() external view returns(address,bool){
         return SecondFunctionContract(address(0),true);
    }

    function callFunctionWithKeyValue() external pure returns(address,bool) {
        return SecondFunctionContract({a: address(0),b:true});
    }
}

contract Account {
    address public senderAddress;
    uint public balance;

    function setAddressAndBalance() public {
        senderAddress = msg.sender;
        balance = msg.sender.balance;
    }

    function transfer(address payable to) public payable {
        to.transfer(msg.value);
    }
}