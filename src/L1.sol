// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./L2.sol";

contract L1 {
    L2 public l2;

    mapping(bytes32 => bool) public stateRoots;

    constructor(address _l2) {
        l2 = L2(_l2);
    }

    function submitState(bytes32 root) external {
        stateRoots[root] = true;
    }

    function verifyState(address user, uint256 balance, bytes32 root) external view returns (bool) {
        require(stateRoots[root], "State not submitted");

        // simplified verification logic
        bytes32 computed = keccak256(abi.encode(user, balance));

        return computed == root;
    }
}
