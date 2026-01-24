// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;

contract VaribleExample{
uint public statevar = 9;
function localVarible() public view returns(uint){
    uint localVal = 20;
    return statevar + localVal;
}
function globalVarible() public view returns (address){
return msg.sender;
}
}