// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./vault.sol";

contract VaultFactory is Ownable{

    address public currentLockAddress;
    address[] public lockList;
    mapping(address => address[]) public ownerLock; 
    constructor(){

    }
    function createLock() public { 
        currentLockAddress = address(new FireLock());
        ownerLock[msg.sender].push(currentLockAddress);
        lockList.push(currentLockAddress);
    }
    function getOwnerLockLenglength() public view returns(uint256){
        return ownerLock[msg.sender].length;
    }
    function getLockList() public view returns(uint256){
        return lockList.length;
    }
}
