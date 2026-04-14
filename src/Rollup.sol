// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Rollup {
    mapping(address => uint256) public state;

    function processTransaction(address user, uint256 amount) external {
        state[user] += amount;
    }

    function computeStateRoot(address user) external view returns (bytes32) {
        return keccak256(abi.encode(user, state[user]));
    }
}
