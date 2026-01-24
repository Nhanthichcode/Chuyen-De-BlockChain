// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract SimpleERC20{
    string public name = "DTH225710";
    string public symbol= "Le_Tri_Nhan";
    uint8 public decimals = 22; 
    uint public totalSupply;

    mapping (address=>uint) public balanceOf;

    constructor(uint initialSupply){
        totalSupply = initialSupply;
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint amount) public returns(bool){
        require(balanceOf[msg.sender] >= amount,"khong du so du");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
