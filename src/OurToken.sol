// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract ourToken is ERC20 {
    /* if an inherited contract has a constructor, the parent constructor must be called
     in this case, we call the ERC20 constructor with the name and symbol*/
    constructor(uint256 initialSupply) ERC20("OurToken", "OT"){
        _mint(msg.sender , initialSupply);
    }
    // The _mint function is used to create new tokens and assign them to an account
    // The initial supply is passed to the constructor and minted to the deployer's address
    

}