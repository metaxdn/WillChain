# SimpleWillChain
A blockchain-based last will and testament executor.
# 📜 SimpleWillChain

**SimpleWillChain** is a minimal Ethereum smart contract for creating a blockchain-based last will and testament. It allows a user (the "Owner") to specify beneficiaries, allocate inheritance amounts, and assign a trusted Executor to distribute the assets upon their passing.

---

## ⚙️ Features

- 👤 Set an Executor to handle the inheritance process.
- 👨‍👩‍👧 Add multiple beneficiaries and define inheritance in ETH.
- 🪙 Automatically distribute ETH upon declaration of death.
- 💼 Simple and gas-efficient design.
- 🔐 Secure access control using modifiers.

---

## 🧾 Smart Contract Overview

### Contract Roles
- **Owner**: The person creating the will. Can add beneficiaries.
- **Executor**: A trusted address that confirms the Owner's death and triggers distribution.
- **Beneficiaries**: Addresses with specified inheritance amounts.

### Key Functions

| Function | Access | Purpose |
|---------|--------|---------|
| `constructor(address _executor)` | Public | Initializes the contract with an Executor. |
| `addBeneficiary(address _wallet, uint256 _amount)` | Owner only | Adds a new beneficiary and sets inheritance amount. |
| `declareDeceased()` | Executor only | Triggers automatic fund distribution to beneficiaries. |
| `receive()` | External | Allows the contract to receive and store ETH. |

---

## 📥 Deployment & Usage

1. **Deploy** the contract via Remix, Hardhat, or Truffle with the Executor address.
2. **Fund** the contract by sending ETH to its address.
3. The **Owner** adds beneficiaries:
    ```solidity
    addBeneficiary(0x123..., 1 ether);
    ```
4. The **Executor** declares the Owner deceased:
    ```solidity
    declareDeceased();
    ```
5. ETH is automatically distributed to all beneficiaries.

---

## 🧪 Sample Test Flow
# The Screenshot
<img width="1470" alt="Screenshot 2025-05-26 at 14 20 49" src="https://github.com/user-attachments/assets/4ba0c6c5-829c-49b7-9780-398882d4a3be" />

```solidity
// 1. Owner adds a beneficiary
addBeneficiary(0xAbc..., 2 ether);

// 2. Fund the contract with ETH
// (Use the "Receive" tab in Remix or send ETH via web3)

// 3. Executor triggers distribution
declareDeceased();




