// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.3/utils/Counters.sol";

contract Vick is ERC721, Ownable {
   using Counters for Counters.Counter;

   Counters.Counter private _tokenIdCounter;

   uint256 MAX_SUPPLY = 30;
   string baseURI = "ipfs://QmUYrA3D4Tmqw1nyBv5k6juENKLwh4cQUTDQ2iPDmCgGQG/";
   string baseExtension = ".json";

   mapping (address => bool) public mintedWallets;

   constructor() ERC721("Vick", "VICK") {}

   function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
       require(
           _exists(tokenId),
           "ERC721Metadata: URI query for nonexistent token"
       );
   return string(abi.encodePacked(baseURI, Strings.toString(tokenId), baseExtension));
   }
   function safeMint(address to) public {
       uint256 tokenId = _tokenIdCounter.current();
       _tokenIdCounter.increment();
       _safeMint(to, tokenId);
   }
}

