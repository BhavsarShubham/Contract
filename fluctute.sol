// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import ERC20 and Ownable contracts from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FluctuateCoin is ERC20, Ownable {
    uint256 public constant TOTAL_SUPPLY = 100_000_000_000 * 10 ** 18; // 100 billion tokens

    // Pass the deployer address to the Ownable constructor
    constructor() ERC20("Real World Asset Coin", "RWA") Ownable(msg.sender) {
        _mint(msg.sender, TOTAL_SUPPLY); // Mint total supply to deployer's address
    }

    // Override the mint function to disable further minting
    function mint(uint256 /*amount*/) external pure returns (bool) {
        revert("Minting is disabled for FluctuateCoin");
    }

    // Override the burn function to allow users to burn their tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}