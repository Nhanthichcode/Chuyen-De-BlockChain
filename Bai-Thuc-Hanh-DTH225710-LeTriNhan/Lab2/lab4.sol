// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract if_else_Example {
    function checkNumber(uint _number) public pure returns(string memory){
        if(_number > 10){
            return "so > 10";
        }else{
            return "so <= 10";
        }
    }
}