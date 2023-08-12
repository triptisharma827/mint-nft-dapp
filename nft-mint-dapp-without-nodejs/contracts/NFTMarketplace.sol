// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // Import ERC721 contract for creating NFTs
import "@openzeppelin/contracts/access/Ownable.sol"; // Import Ownable contract to manage ownership

contract NFTMarketplace is ERC721, Ownable {
    uint256 public constant MAX_NFT_SUPPLY = 5; // Maximum number of NFTs that can be minted
    uint256 public nextTokenId = 1; // ID for the next NFT to be minted
    uint256 public mintPrice = 0.01 ether; // Price in Ether required to mint an NFT

    constructor() ERC721("NFT Marketplace Collection", "NFTM") {} // Constructor for the contract

    // Function to mint an NFT
    function mintNFT() external payable {
        // Check if the maximum supply of NFTs has been reached
        require(nextTokenId <= MAX_NFT_SUPPLY, "All NFTs have been minted");
        // Check if the sent Ether is sufficient to cover the minting price
        require(msg.value >= mintPrice, "Insufficient Ether sent");

        // Mint a new NFT and assign it to the sender's address
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;

        // If the sent Ether is more than the minting price, refund the excess
        if (msg.value > mintPrice) {
            payable(msg.sender).transfer(msg.value - mintPrice);
        }
    }

    // Function to set a new minting price, only callable by the contract owner
    function setMintPrice(uint256 _newMintPrice) external onlyOwner {
        mintPrice = _newMintPrice;
    }

    // Function to withdraw the contract's funds, only callable by the contract owner
    function withdrawFunds() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
