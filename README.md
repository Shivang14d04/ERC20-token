# OurToken (ERC-20)

OurToken is a simple ERC-20 token implementation written in Solidity using OpenZeppelin’s ERC-20 standard.  
It comes with a complete Foundry test suite covering transfers, approvals, allowances, events, and token metadata.

---

## 📌 Features

- **ERC-20 Standard** compliant token.
- Built using **OpenZeppelin** contracts for security and reliability.
- **Automated testing** with Foundry (`forge-std`).
- Includes tests for:
  - Token metadata (name, symbol, decimals)
  - Transfers (success, failure, and event emission)
  - Approvals & allowances
  - `transferFrom` behavior
  - Total supply verification

---

## 🛠 Tech Stack

- **Solidity** `^0.8.30`
- **OpenZeppelin Contracts**
- **Foundry** for testing

---

## 🚀 Getting Started

### 1 Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 2 Install Dependencies

```forge install OpenZeppelin/openzeppelin-contracts

```

### Note: these commands can vary according to the Makefile

### 3 Build

```
forge build
```

### 4 Run tests

```
forge test
```

### 5 Run a Specific Test

```
forge test --match-test testBobBalance -vvvv

```
