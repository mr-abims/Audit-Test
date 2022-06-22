//SPDX-License-Identifier:Unlicensed
pragma solidity 0.6.12;

import "forge-std/Test.sol";
import "../MGGovToken.sol";

contract TestMockGovToken is Test {
    MockGovToken _token;
    address testAddr = 0xB61b55708325fC681b584a48Bf1492f6AebCee89;

    function setUp() public {
        _token = new MockGovToken();
    }

    function testMintAsAddress() external {
        _token.mint(testAddr, 1000000000);
        assertEq(_token.balanceOf(testAddr), 1000000000);
    }

    function testBurnAsOwner() external {
        _token.mint(testAddr, 30000000);
        _token.burn(testAddr, 15000000);
        assertEq(_token.balanceOf(testAddr), 15000000);
    }
    function testBurnNotOwner() external {
        vm.prank(testAddr);
        _token.mint(testAddr, 3000000);
        _token.burn(testAddr, 1500000);
    }
    function testFailGetPriorVotes() external {
        _token.getPriorVotes(testAddr, 100);
    }
     function testDelegate() external {
        _token.delegate(testAddr);
    }
}