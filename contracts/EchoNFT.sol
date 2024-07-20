// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EchoNFT is ERC721Enumerable, Ownable {
    uint256 public tokenCounter;

    struct Echo {
        string name;
        uint256 power;
        uint256 defense;
        uint256 speed;
    }

    mapping(uint256 => Echo) public tokenIdToEcho;

    event BattleResult(uint256 winnerTokenId);

    constructor() ERC721("EchoNFT", "ECHO") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function createEcho(string memory name) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);

        // Initialize Echo attributes
        tokenIdToEcho[newTokenId] = Echo(
            name,
            random(100), // power
            random(100), // defense
            random(100)  // speed
        );

        tokenCounter += 1;
        return newTokenId;
    }

    function random(uint256 max) private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % max;
    }

    function getEchoName(uint256 tokenId) public view returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        return tokenIdToEcho[tokenId].name;
    }

    function battle(uint256 tokenId1, uint256 tokenId2) public returns (uint256) {
        require(_ownerOf(tokenId1) != address(0) && _ownerOf(tokenId2) != address(0), "Tokens must exist");
        require(ownerOf(tokenId1) == msg.sender, "You must own the first token");

        Echo memory echo1 = tokenIdToEcho[tokenId1];
        Echo memory echo2 = tokenIdToEcho[tokenId2];

        uint256 score1 = echo1.power + echo1.defense + echo1.speed + random(50);
        uint256 score2 = echo2.power + echo2.defense + echo2.speed + random(50);

        uint256 winnerTokenId = (score1 > score2) ? tokenId1 : (score2 > score1) ? tokenId2 : 0;

        emit BattleResult(winnerTokenId);
        return winnerTokenId;
    }
}
