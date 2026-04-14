// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Rollup.sol";

contract RollupTest is Test {
    Rollup rollup;

    function setUp() public {
        rollup = new Rollup();
    }

    function testStateUpdate() public {
        rollup.processTransaction(address(1), 100);

        bytes32 root = rollup.computeStateRoot(address(1));

        assertTrue(root != bytes32(0));
    }
}
