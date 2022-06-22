//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../MockAccessControl.sol";

contract TestMinion is Test {
    Minion _min;
    address constant owner = 0xB61b55708325fC681b584a48Bf1492f6AebCee89;


    function setUp() public {
        _min = new Minion();
    }

    function testPwnAsContract() external {
        _min.pwn();
    }
    
    function testFailPwnAsEOA(uint96 amount) external {
        vm.prank(address(0));
        vm.assume(amount > 0.02 ether);
        _min.pwn();
    }

    function testToRetrieveOwner() external {
        vm.prank(owner);
        _min.retrieve();
    }
     function testVerify() external view returns(bool) {
        return _min.verify(owner);
    }
     function testTimeVal() external {
        assertEq(_min.timeVal(), block.timestamp);
    }
    
    function testFailVerifyAccountZero() external view returns(bool) {
        return _min.verify(address(0));
    }
}