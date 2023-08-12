// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

// Import necessary contracts from the OpenZeppelin library
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // Import ERC721 contract for creating NFTs
import "@openzeppelin/contracts/access/Ownable.sol"; // Import Ownable contract to manage ownership

// Contract definition for the NFT marketplace
contract NFTMarketplace is ERC721, Ownable {
    // Maximum number of NFTs that can be minted
    uint256 public constant MAX_NFT_SUPPLY = 5;
    
    // ID for the next NFT to be minted
    uint256 public nextTokenId = 1;
    
    // Price in Ether required to mint an NFT
    uint256 public mintPrice = 0.01 ether;

    // Constructor for the contract
    constructor() ERC721("NFT Marketplace Collection", "NFTM") {}

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
