
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleWillChain {
    address public owner;
    address public executor;
    bool public isDeceased;

    struct Beneficiary {
        address wallet;
        uint256 amount;
    }

    Beneficiary[] public beneficiaries;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyExecutor() {
        require(msg.sender == executor, "Not executor");
        _;
    }

    modifier onlyIfDeceased() {
        require(isDeceased, "Owner is still alive");
        _;
    }

    constructor(address _executor) payable {
        owner = msg.sender;
        executor = _executor;
    }

    function addBeneficiary(address _wallet, uint256 _amount) public onlyOwner {
        beneficiaries.push(Beneficiary(_wallet, _amount));
    }

    function declareDeceased() public onlyExecutor {
        isDeceased = true;
        distribute();
    }

    function distribute() internal onlyIfDeceased {
        for (uint i = 0; i < beneficiaries.length; i++) {
            Beneficiary memory b = beneficiaries[i];
            if (address(this).balance >= b.amount) {
                payable(b.wallet).transfer(b.amount);
            }
        }
    }

    receive() external payable {}
}
