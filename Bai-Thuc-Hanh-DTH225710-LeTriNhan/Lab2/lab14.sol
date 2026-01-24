// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract ErrorExample{
    uint public value;
    function giaoDich(uint _value) public{
        require(_value>0," gia tri phai lon hon 0");
        value = _value;
    }
}