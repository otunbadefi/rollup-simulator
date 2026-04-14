// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract L2 {
    mapping(address => uint256) public balance;
    address public sequencer;

    constructor() {
        sequencer = msg.sender;
    }

    function executeTransfer(address to, uint256 amount) external {
        require(msg.sender == sequencer, "Only sequencer");

        balance[to] += amount;
    }

    function updateBalance(address user, uint256 amount) external {
        require(msg.sender == sequencer, "Only sequencer");

        balance[user] = amount;
    }

    function getState(address user) external view returns (uint256) {
        return balance[user];
    }
}
