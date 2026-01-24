// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract Parent{
    function greetInParent() public pure returns(string memory){
        return "I am Parent !!!";
    }
}

    contract Child is Parent{
     function greetChil() public pure returns(string memory){
        return greetInParent();
     }
    }
    