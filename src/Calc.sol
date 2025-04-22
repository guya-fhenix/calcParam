// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CalcParamLib.sol";

contract Calc {
    event CalcResult(string operation, calcParam result);
    
    mapping(address => calcParam) public latestResults;

    function add(calcParam x, calcParam y) public returns (calcParam) {
        calcParam result = x + y;
        latestResults[msg.sender] = result;
        emit CalcResult("Addition", result);
        return result;
    }

    function sub(calcParam x, calcParam y) public returns (calcParam) {
        calcParam result = x - y;
        latestResults[msg.sender] = result;
        emit CalcResult("Subtraction", result);
        return result;
    }

    function mul(calcParam x, calcParam y) public returns (calcParam) {
        calcParam result = x * y;
        latestResults[msg.sender] = result;
        emit CalcResult("Multiplication", result);
        return result;
    }

    function div(calcParam x, calcParam y) public returns (calcParam) {
        calcParam result = x / y;
        latestResults[msg.sender] = result;
        emit CalcResult("Division", result);
        return result;
    }

    function getLatestResult() public view returns (calcParam) {
        return latestResults[msg.sender];
    }
} 