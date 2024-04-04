// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CounterVRF} from "../src/CounterVRF.sol";

contract CounterVRFDeploy is Script {
    address public constant OPERATOR = 0xB00C80A94Ca9A1A5a15A80F30Ae69b6C81389072;

    CounterVRF public vrf;

    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        vrf = new CounterVRF(OPERATOR);

        vm.stopBroadcast();

        console.log("CounterVRF deployed at address: ", address(vrf));
    }
}
