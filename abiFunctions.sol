// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6; 

contract EncodeDecode {
    function encode1(string memory _str1, uint _int, string memory _str2) public pure returns(bytes memory) {
        return(abi.encode(_str1,_int,_str2));
    }

    function decode1(bytes memory data) public pure returns(string memory _str1, uint _int, string memory _str2) {
         (_str1,_int,_str2)=abi.decode(data,(string,uint,string));
    }
}

// Inbuilt function that'll take care of the above
// Must verify the logic if in advanced sucurity based projects
// 1) Soidity -> 20-30%
// 2) ReactJS + NodeJS(EthersJS/ Web3JS) -> 70%-80%
