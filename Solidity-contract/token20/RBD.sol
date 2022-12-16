pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract RBD is ERC20,Ownable{
    event AdminChange(address indexed Admin, address indexed newAdmin);
    constructor() ERC20("RBD", "RBD") {
        
        _mint(msg.sender, 10_000_000_000 *10 ** 18);
    }
 
    function burn(address account, uint256 amount) external onlyOwner{
        _burn(account, amount);
    }
}
