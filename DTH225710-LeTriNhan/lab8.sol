// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract Mapping_Examples{
    mapping(address=>uint) public balances;
    
    function setBalance(uint _value) public{
        balances[msg.sender] = _value;
    }

    function getBalance() public  view returns(uint){
        return balances[msg.sender];
    }
}