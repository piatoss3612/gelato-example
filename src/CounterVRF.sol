// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {GelatoVRFConsumerBase} from "vrf-contracts/GelatoVRFConsumerBase.sol";

contract CounterVRF is GelatoVRFConsumerBase {
    address public operator;
    address public owner;
    uint256 public number;

    event NumberSet(uint256 number);

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("only owner");
        }
        _;
    }

    constructor(address operator_) {
        operator = operator_;
        owner = msg.sender;
    }

    function _operator() internal view override returns (address) {
        return operator;
    }

    function requestRandomness() public onlyOwner {
        // extraData is empty
        _requestRandomness("");
    }

    function _fulfillRandomness(uint256 randomness, uint256 requestId, bytes memory extraData) internal override {
        number = randomness;
        emit NumberSet(number);
    }

    function increment() public {
        number++;
    }
}
