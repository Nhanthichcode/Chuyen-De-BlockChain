// SPDX-License-Identifier: DTH225710-Le Tri Nhan

pragma solidity ^0.8.31;
contract PayableExample{
    event Receive(address sender, uint amount);
    receive() external payable {
        emit Receive(msg.sender, msg.value);
     }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}