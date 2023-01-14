// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint256 amount, address payable destAddress) {
        require(owner == msg.sender, "Only owner can withdraw!");
        require(amount <= balance, "Insufficient funds");

        destAddress.transfer(amount);
        balance -= amount;
    }
}