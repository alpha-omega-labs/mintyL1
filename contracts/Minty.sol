// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Minty is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct NFTMetadata {
        string name;
        string description;
        string fileContent;
    }

    mapping(uint256 => NFTMetadata) private _tokenMetadata;

    constructor(string memory tokenName, string memory symbol) ERC721(tokenName, symbol) {}

    function mintToken(address owner, string memory name, string memory description, string memory fileContent)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 id = _tokenIds.current();
        _safeMint(owner, id);

        _tokenMetadata[id] = NFTMetadata({
            name: name,
            description: description,
            fileContent: fileContent
        });

        return id;
    }

    function getMetadata(uint256 tokenId) public view returns (string memory, string memory, string memory) {
        require(_exists(tokenId), "Token does not exist");

        NFTMetadata storage metadata = _tokenMetadata[tokenId];
        return (metadata.name, metadata.description, metadata.fileContent);
    }
}
