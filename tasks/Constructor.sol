// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title Contract A & B
/// @notice assigment 2.3.9 - Contructor task

contract ContractA{
 
 // State variables
 address immutable owner;
 uint FEE;

// initialize Contract B states
 constructor (uint _fee){
    owner = msg.sender;
    FEE = _fee;
 }

}

// Contract B inherits from Contract A
contract ContractB is ContractA{

   address immutable ownerB;

   // initialize Contract B and A takeing fee as a parameter
   constructor(uint _fee) ContractA(_fee){
      ownerB = msg.sender;
   }
 
}