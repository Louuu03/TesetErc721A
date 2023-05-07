// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC721A.sol";

contract TryErc721Test is Test {
    TryErc721A public Erc721A;
    TryErc721 public Erc721;

    address owner = makeAddr("owner");
    address user1 = makeAddr("user1");

    function setUp() public {
        Erc721A = new TryErc721A("Test", "T");
        Erc721 = new TryErc721("Test", "T");
    }

    function testMint() public {
        vm.startPrank(owner);
        //ERC721A
        Erc721A.mint(10);
        uint256 balance721A = Erc721A.balanceOf(owner);

        //ERC721Enum
        for (uint i = 0; i < 10; ) {
            Erc721.mint(i);
            ++i;
        }
        uint256 balance721 = Erc721.balanceOf(owner);

        //check
        assertEq(balance721A, 10);
        assertEq(balance721, 10);

        vm.stopPrank();
    }

    function testTransfer() public {
        vm.startPrank(owner);
        //ERC721A
        Erc721A.mint(1);
        Erc721A.safeTransferFrom(owner, user1, 0);
        uint256 balance721A = Erc721A.balanceOf(owner);

        //ERC721Enum
        Erc721.mint(0);
        Erc721.safeTransferFrom(owner, user1, 0);
        uint256 balance721 = Erc721.balanceOf(owner);

        //check
        assertEq(Erc721A.ownerOf(0), user1);
        assertEq(Erc721.ownerOf(0), user1);

        vm.stopPrank();
    }

    function testApprove() public {
        vm.startPrank(owner);
        //ERC721A
        Erc721A.mint(1);
        Erc721A.approve(user1, 0);

        //ERC721Enum
        Erc721.mint(0);
        Erc721.approve(user1, 0);

        //check
        assertEq(Erc721A.getApproved(0), user1);
        assertEq(Erc721.getApproved(0), user1);

        vm.stopPrank();
    }
}
