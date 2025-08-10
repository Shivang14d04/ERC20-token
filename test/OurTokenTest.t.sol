// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {ourToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test{
    ourToken public token;
    DeployOurToken public deployer ;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint public constant STARTING_BALANCE = 100 ether;

function setUp() public {
   deployer = new DeployOurToken();
    token = deployer.run();
    // deployer.run() deploys the OurToken contract and returns the instance

    vm.prank(address(msg.sender));
    // vm.prank is used to simulate a transaction from a specific address
    // in this case, the deployer's address
    
    token.transfer(bob, STARTING_BALANCE);
   }

   function testBobBalance() view public {
    assertEq(STARTING_BALANCE , token.balanceOf(bob));
    // This test checks if Bob's balance is equal to the starting balance of 100 ether  
    // assertEq is a function from forge-std that checks if two values are equal
   }
   function testAllowancesWorks() public {
    uint initialAllowance = 1000;
    // Bob approves Alice to spend 1000 tokens on his behalf
    vm.prank(bob);
    token.approve(alice, initialAllowance);
    // This line simulates Bob approving Alice to spend 1000 tokens on his behalf
    // The approves function is a part of the ERC20 standard and allows one address to spend
    // tokens on behalf of another address
    uint transferAmount = 500;
    vm.prank(alice);
    token.transferFrom(bob, alice, transferAmount);
    // the difference between transfer and transferFrom is that transferFrom allows
    // one address to transfer tokens from another address, provided that the sender has been approved
    // to spend the tokens on behalf of the owner
    // In this case, Alice is transferring 500 tokens from Bob's account to her own
    // The transferFrom function checks if Alice has been approved to spend Bob's tokens
    // and if Bob has enough balance to cover the transfer
    assertEq(token.balanceOf(alice), transferAmount);
    // This line checks if Alice's balance is equal to the transfer amount of 500 tokens
    assertEq(token.balanceOf(bob), STARTING_BALANCE - transferAmount);
    // This line checks if Bob's balance is equal to the starting balance minus the transfer amount
    // This ensures that the transfer was successful and the balances are updated correctly
   }

     function testTransferFromWorks() public {
        uint initialAllowance = 1000;
        vm.prank(bob);
        token.approve(alice, initialAllowance);

        uint transferAmount = 500;
        vm.prank(alice);
        token.transferFrom(bob, alice, transferAmount);

        assertEq(token.balanceOf(alice), transferAmount);
        assertEq(token.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(token.allowance(bob, alice), initialAllowance - transferAmount);
    }

    function testTransferFromFailsIfNotApproved() public {
        vm.prank(alice);
        vm.expectRevert();
        token.transferFrom(bob, alice, 1 ether);
    }

    function testTransferFromFailsIfInsufficientBalance() public {
        vm.prank(bob);
        token.approve(alice, 100 ether);

        vm.prank(alice);
        vm.expectRevert();
        token.transferFrom(bob, alice, STARTING_BALANCE + 1 ether);
    }
}