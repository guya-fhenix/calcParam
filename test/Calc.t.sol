// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Calc, calcParam} from "../src/Calc.sol";

contract CalcTest is Test {
    Calc public calc;

    function setUp() public {
        calc = new Calc();
    }

    function testAdd() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(3);
        calcParam result = calc.add(x, y);
        assertEq(calcParam.unwrap(result), 8);
    }

    function testSub() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(3);
        calcParam result = calc.sub(x, y);
        assertEq(calcParam.unwrap(result), 2);
    }

    function testMul() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(3);
        calcParam result = calc.mul(x, y);
        assertEq(calcParam.unwrap(result), 15);
    }

    function testDiv() public {
        calcParam x = calcParam.wrap(6);
        calcParam y = calcParam.wrap(3);
        calcParam result = calc.div(x, y);
        assertEq(calcParam.unwrap(result), 2);
    }

    function testDivByZero() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(0);
        vm.expectRevert();
        calc.div(x, y);
    }

    function testLatestResult() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(3);
        calc.add(x, y);
        calcParam result = calc.getLatestResult();
        assertEq(calcParam.unwrap(result), 8);
    }

    function testEventEmission() public {
        calcParam x = calcParam.wrap(5);
        calcParam y = calcParam.wrap(3);

        vm.expectEmit(true, true, true, true);
        emit Calc.CalcResult("Addition", calcParam.wrap(8));
        calc.add(x, y);
    }
}
