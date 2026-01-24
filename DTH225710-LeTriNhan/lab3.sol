// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract FunctionsExample {
    uint numBer = 99;

    function setNumber(uint _number) public {
    numBer = _number;
    }

    function getNumber() public view returns (uint) {
        return numBer;
    }
} 