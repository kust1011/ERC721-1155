// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
contract WTFApe is ERC721{
   uint public MAX_APES = 10000; // 總量


   // 構造函數
   constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_){
   }


   //BAYC的baseURI為ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/
   function _baseURI() internal pure override returns (string memory) {
       return "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
   }
  
   // 鑄造函數
   function mint(address to, uint tokenId) external {
       require(tokenId >= 0 && tokenId < MAX_APES, "tokenId out of range");
       _mint(to, tokenId);
   }
}
