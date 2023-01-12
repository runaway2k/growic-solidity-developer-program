// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title MyContract
/// @notice assigment 2.3.8 - Fallback task extended from mappings task

contract MyContract {
    mapping(address=>uint256) userBalance;

    // deposit a real amount of wei into the user balance
    function deposit() payable public {
        require(msg.value>0,"Amount must be greater than 0");
        userBalance[msg.sender] += msg.value;
    }

    // return the current balance of the sender user
    function checkBalance() public view returns(uint256) {
        return userBalance[msg.sender];
    }

    // Payable fallback
    // Any call with non-empty calldata to this contract will execute this
    fallback() external payable{
        deposit();
    }

    // This function is called for plain transfers, i.e.
    // for every call with empty calldata
    receive() external payable{
        deposit();
    }
}