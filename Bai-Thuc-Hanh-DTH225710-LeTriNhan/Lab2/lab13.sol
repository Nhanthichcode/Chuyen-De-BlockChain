// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract DataLocationExample{
    uint[] public number;

    function addNumber(uint _number)public{
        number.push(_number);
    }

    function getTempArray()public view returns(uint[] memory){
        uint[] memory tmp;
        tmp = number;
        return tmp;

    }
}