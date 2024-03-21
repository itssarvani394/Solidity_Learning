// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract A {
    // event is used to store logs; when u want to log something to the blockchain
    event callEvent(address sender, address origin, address from);
    function callThis() public {
        //Global variables
        // tx.origin will always be a EOA for any SC calling each other in chaining
        // address(this) will just tell at which address the 'called' function is deployed
        emit callEvent(msg.sender,tx.origin,address(this));
    } 
}

// EOA - SC1-SC2-SC3-SC4-(chaining) we are in context of SC2

contract Caller {
    // takes parameter of real address where ContractA is deployed
    function makeCalls(address _contractAddress) public {
        // to encode & securely transfer of data from SC to another
        // function name in ABI is in the format "callThis()"
        address(_contractAddress).call(abi.encodeWithSignature("callThis()"));
    }
}

// message - "hello" -> calleed contract

// Caller
/* "sender": "0x0813d4a158d06784FDB48323344896B2B1aa0F85",
"origin": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
"from": "0xC3Ba5050Ec45990f76474163c5bA673c244aaECA" */

// caller contract is deployed at 0xC3Ba5050Ec45990f76474163c5bA673c244aaECA

// Called - A
/* "sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
"origin": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
"from": "0xC3Ba5050Ec45990f76474163c5bA673c244aaECA" */