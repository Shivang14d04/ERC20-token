// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ManualToken{

    mapping(address => uint) private balances;

    function name() public pure returns (string memory){
        return "ManualToken";
    }

    function symbol() public pure returns (string memory){
        return "MTK";
    }

    function totalSupply() public pure returns(uint){
        return 100 ether;
    } 

    function decimals() public pure returns(uint8){
        return 18;
    }

    function balanceOf(address account) public view returns(uint){
        return balances[account];
    }

    function transfer(address to , uint amount)public {
        uint previousBalances = balanceOf(msg.sender) + balanceOf(to);

        balances[msg.sender] -= amount;
        balances[to] += amount;
        require(balances[msg.sender] +  balances[to] == previousBalances, "Transfer failed: balance mismatch");

    }

}