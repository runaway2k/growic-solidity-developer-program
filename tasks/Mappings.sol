// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title Mapping taks
/// @notice assigment 2.3.2

contract Mappings {
    mapping(address=>uint256) userBalance;

    // deposit a certain positive amount into the user balance
    function deposit(uint256 amount) public {
        require(amount>0,"Amount must be greater than 0");
        userBalance[msg.sender] += amount;
    }

    // return the current balance of the sender user
    function checkBalance() public view returns(uint256) {
        return userBalance[msg.sender];
    }
}