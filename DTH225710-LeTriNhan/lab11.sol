// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract ModifierExample{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Khong phai chu so huu");
        _;
    }

    function changerOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
}
