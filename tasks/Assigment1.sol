// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

contract Assignment1 {
    /*
    Solidity value types, an example for each of the solidity value types below
	Signed integers
	Unsigned integers
	Boolean
	Addresses
	Enums
	Bytes
    */

	enum Status {
        Active,
		Suspended
    }
    
	int256 var1;
    uint256 var2;
    bool flag;
	address wallet;
	Status status;
	bytes32 myHash;
 
	constructor () {
	//Set initial values
		var1 = -3000;
		var2 =  9500;
		flag = true;
		wallet = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
		status = Status.Active;
		myHash = 0xc5d2460186f7233c927e7db2dcc703c0e511b653ca82273b7bfad8045d85a470;
    }

 
}