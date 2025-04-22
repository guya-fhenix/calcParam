// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type calcParam is uint256;

function addOp(calcParam x, calcParam y) pure returns (calcParam) {
    return calcParam.wrap(calcParam.unwrap(x) + calcParam.unwrap(y));
}

function subOp(calcParam x, calcParam y) pure returns (calcParam) {
    return calcParam.wrap(calcParam.unwrap(x) - calcParam.unwrap(y));
}

function mulOp(calcParam x, calcParam y) pure returns (calcParam) {
    return calcParam.wrap(calcParam.unwrap(x) * calcParam.unwrap(y));
}

function divOp(calcParam x, calcParam y) pure returns (calcParam) {
    return calcParam.wrap(calcParam.unwrap(x) / calcParam.unwrap(y));
}

using {addOp as +, subOp as -, mulOp as *, divOp as /} for calcParam global; 