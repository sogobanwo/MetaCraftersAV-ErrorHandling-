// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherBank {
    mapping(address => uint256) public balances;
    uint256 public totalDeposits;

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    function deposit() external payable {
        require(msg.sender != address(0), "Address zero detected");

        if (msg.value >= 1 ether) {
            balances[msg.sender] = balances[msg.sender] + msg.value;
            totalDeposits = totalDeposits + msg.value;
        } else {
            revert("Amount must be greater than or equal to 1 ether");
        }

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(_amount > 0, "Withdrawal amount must be greater than zero");
        assert(_amount <= balances[msg.sender]);

        balances[msg.sender] -= _amount;
        totalDeposits -= _amount;

        payable(msg.sender).transfer(_amount);
        emit Withdrawal(msg.sender, _amount);
    }

    function totalBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
