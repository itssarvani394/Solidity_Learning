// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    // Entities -> manager, players & winner
    address public manager;
    address payable[] public players;
    address payable public winner;

    constructor() {
        manager=msg.sender;
    }

    function participate() public payable {
        require(msg.value == 1 ether,"Please pay 1 Ether only");
        players.push(payable(msg.sender));
    }

    // To check the balance of smart contract or how many people have participated in the lottery
    function getBalance() public view returns(uint) {
        require(manager==msg.sender,"You are not the manager");
        return address(this).balance;
    }

    // Random Function
    // Use a Oracle -> to get a random number
    function random() internal view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }

    function pickWinner() public {
        require(manager==msg.sender,"You are not the manager");
        require(players.length>=3,"Players are less than 3");

        uint r = random();
        uint index = r%players.length;
        winner=players[index];
        winner.transfer(getBalance());

        // This will re-initialize the players array back to zero
        players = new address payable[](0);
    }
}