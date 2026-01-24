// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract array_Example{
    uint[] public arrayNumber;

    function addNumber(uint _num) public {
        arrayNumber.push(_num);
    }

    function getNumber(uint index) public view returns(uint){       
        return arrayNumber[index];       
    }

    function popNumber() public returns (string memory) {
        if (arrayNumber.length == 0) {
            return "mang rong!!";
        } else {
            arrayNumber.pop();
            return "da xoa phan tu cuoi";
        }
    }
}