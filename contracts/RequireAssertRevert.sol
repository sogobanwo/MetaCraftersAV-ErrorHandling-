// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RequireAssertRevert {
    uint256 public value;

    constructor(uint256 _value) {
        value = _value;
    }


    function requireExample(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");
        value -= _amount;
    }

    function assertExample(uint256 _amount) public {
        assert(_amount > 0);
        value += _amount;
    }

    function revertExample(uint _a, uint _b) public pure returns(uint) {    

        // Revert if b is zero
        if (_b == 0) {
            revert("Cannot divide by zero");
        }

        // Perform a division
        uint256 result = _a / _b;
        return result;
    }
}
