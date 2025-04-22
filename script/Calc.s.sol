// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Calc} from "../src/Calc.sol";

contract CounterScript is Script {
    Calc public calc;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        calc = new Calc();

        vm.stopBroadcast();
    }
}
