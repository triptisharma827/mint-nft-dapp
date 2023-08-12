// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarketplace is ERC721, Ownable {
    uint256 public constant MAX_NFT_SUPPLY = 5;
    uint256 public nextTokenId = 1;
    uint256 public mintPrice = 0.01 ether;

    constructor() ERC721("NFT Marketplace Collection", "NFTM") {}

    function mintNFT() external payable {
        require(nextTokenId <= MAX_NFT_SUPPLY, "All NFTs have been minted");
        require(msg.value >= mintPrice, "Insufficient Ether sent");

        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;

        if (msg.value > mintPrice) {
            payable(msg.sender).transfer(msg.value - mintPrice);
        }
    }

    function setMintPrice(uint256 _newMintPrice) external onlyOwner {
        mintPrice = _newMintPrice;
    }

    function withdrawFunds() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
