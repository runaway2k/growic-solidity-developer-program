// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

/// @title My Contract Token
/// @notice Assigment 2.3.5 - Inheritance task


// Import openZepplin ERC20 library
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("myToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}