// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {Script} from "forge-std/Script.sol";
import {ourToken} from "../src/OurToken.sol";
// This script deploys the OurToken contract with an initial supply of 1000 tokens
// The initial supply is specified in the constructor of the OurToken contract

contract DeployOurToken is Script{

    uint256 public constant INITIAL_SUPPLY = 1000 ether; // 1000 tokens with 18 decimals

    function run()external returns(ourToken){
      vm.startBroadcast();   
      ourToken token = new ourToken(INITIAL_SUPPLY);
      vm.stopBroadcast();
      // The contract is deployed and the initial supply is minted to the deployer's address
      // The deployer's address is the address that runs this script
      return token;
      // The initial supply is set to 1000 tokens with 18 decimals, which is equivalent to 1000 ether
    }

    

}