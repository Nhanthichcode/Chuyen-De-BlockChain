// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract EventExample{
    event EventChanged(uint newValue);
    uint public value;
    function setValue(uint _value)public{
        value = _value;
        emit EventChanged(_value);
    }
}