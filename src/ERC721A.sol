// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "lib/ERC721A/contracts/ERC721A.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract TryErc721A is ERC721A {
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721A(_name, _symbol) {}

    function mint(uint256 quantity) external payable {
        // _safeMint's second argument now takes in a quantity, not a tokenId.
        _safeMint(msg.sender, quantity);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }
}

contract TryErc721 is ERC721Enumerable {
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {}

    function mint(uint256 tokenId) external {
        _safeMint(msg.sender, tokenId);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }
}
