// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title User Info
/// @notice assigment 2.3.3 - Struct task
/// @dev an extension of mapping.sol contract


contract UsersInfo {
    // UserInfo Struct definition:
    // name and age for KYC measure
    struct UserData {
        string name;
        uint256 age;
    }

    // Here we only store user data for KYC users
    mapping(address=>UserData) userData;
    
    // User balance
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

    function setUserDetails(string calldata name, uint256 age) public {
        require(age>0,"Age must be greater than 0");
        require(bytes(name).length>0,"Name cannot be empty");
        userData[msg.sender] = UserData({name:name,age:age});
    }

    // return the current balance of the sender user
    function getUserDetail() public view returns(UserData memory){
        return userData[msg.sender];
    }


}