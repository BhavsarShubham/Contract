// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Stablecoin is ERC20 {
    address public admin;
    uint256 public constant TOTAL_SUPPLY = 500_000_000_000 * 10 ** 18; // 500 billion tokens

    constructor() ERC20("Real World Asset USD", "RWAUSD") {
        admin = msg.sender;
        _mint(msg.sender, TOTAL_SUPPLY); // Mint total supply to deployer's address
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, "only admin can mint");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}