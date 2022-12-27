pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract RBD is ERC20,Ownable{
    address public mintAddr;
    event AdminChange(address indexed Admin, address indexed newAdmin);
    constructor() ERC20("RBD", "RBD") {
        
        _mint(msg.sender, 10_000_000_000 *10 ** 18);
    }
    function setMintAddress(address _mintAddr) public onlyOwner{
    mintAddr = _mintAddr;
    }
    function mint(address account, uint256 amount ) external {
        require(msg.sender == mintAddr,'u are not mint address');
        _mint(account, amount);
    }
    function burn(address account, uint256 amount) external {
        require(msg.sender == mintAddr,'u are not burn address');
        _burn(account, amount);
    }
}
