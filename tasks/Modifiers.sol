// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title My Contract
/// @notice Upadated for assigment 2.3.4 - Modifier task


contract MyContract {

    // Contract owner
    address private owner;

    // Contract Funds
    uint256 private funds;

    // Constant Fee
    uint256 private FEE = 50;

    
    // UserInfo Struct definition:
    // name, age and balance 
    struct UserData {
        string name;
        uint256 age;
        uint256 balance;
    }

    // Set the contract owner
    constructor(){
        owner = msg.sender;
    }

    // Here we only store user data 
    mapping(address=>UserData) userData;
    

    // To use where only the contract owner can use the function
    modifier onlyOwner(){
        require(owner==msg.sender,"Not the owner");
        _;
    }

    // check that the amount is greater than 0
    modifier isPositive(uint256 _amount){
        require(_amount>0,"Amount must be greater than 0");
        _;
    }

    // check if the user used deposit funtion previously
    modifier priorDeposit () {
        require(userData[msg.sender].balance>0,"Use deposit first");
        _;
    }

    // Check that minimum value sent is greater or equal to the Fee
    modifier minimumFee(uint256 _amount) {
        if(_amount < FEE ) 
            revert CustomError({
                sent: _amount,
                minRequired: FEE
            });
        _;
    }

    // Custom Error declaration
    error CustomError(uint256 sent, uint256 minRequired);

    // deposit a certain positive amount into the user balance
    function deposit(uint256 amount) public isPositive(amount) {
        userData[msg.sender].balance += amount;
    }

    // return the current balance by the sender user
    function checkFunds() public view returns(uint256) {
        return funds;
    }

    // Set user's name and age
    function setUserDetails(string calldata name, uint256 age) public {
        require(age>0,"Age must be greater than 0");
        require(bytes(name).length>0,"Name cannot be empty");
        userData[msg.sender].name = name;
        userData[msg.sender].age = age;
    }

    // return the user info of the sender user
    function getUserDetail() public view returns(UserData memory){
        return userData[msg.sender];
    }

    // Transfer the funs to the owner
    function withdraw() public onlyOwner {
        userData[owner].balance += funds;
        funds = 0; 
    }

    // add fund to the contract
    function addFunds(uint256 amount) public isPositive(amount) priorDeposit minimumFee(amount) {
        userData[msg.sender].balance += amount;
        funds += amount;
    }

}