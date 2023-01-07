// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./vault.sol";

contract VaultFactory is Ownable{

    mapping(address => address) public currentLockAddress;
    address[] public lockList;
    mapping(address => address[]) public ownerLock; 
    bool public status;
    constructor(){
    }
    //onlyOwner
    function setStatus() public onlyOwner{
        !status;
        }
    //main
    function createLock() public { 
        require(!status,"the contract status is error");
        currentLock = address(new FireLock());
        ownerLock[msg.sender].push(currentLock);
        currentLockAddress[msg.sender] = currentLock;
        lockList.push(currentLock);
    }
    function checkCurrentLockAddress() public view returns(address){
        return currentLockAddress[msg.sender];
    function getOwnerLockLenglength() public view returns(uint256){
        return ownerLock[msg.sender].length;
    }
    function getLockList() public view returns(uint256){
        return lockList.length;
    }
}
