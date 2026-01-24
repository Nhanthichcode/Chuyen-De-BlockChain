// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract for_loop_Examples{
    function sum(uint _num) public pure returns (uint){
        uint total = 0;
        for(uint i=0;i<=_num;i++){
            total+=i;
        }
        return total;
    }
}