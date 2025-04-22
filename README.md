# Calc Contract Learning Project

This is a learning project that implements a simple calculator contract using Solidity. The project demonstrates various concepts including:
- Custom value types using `type` in Solidity
- Basic arithmetic operations
- Event emissions
- State management
- Testing with both Foundry and Hardhat

## Project Structure

The project follows a hybrid structure that works with both Foundry and Hardhat:
```
├── src/           # Solidity source files
│   ├── Calc.sol   # Main calculator contract
│   └── CalcParamLib.sol  # Library for calcParam type
├── test/          # Test files
│   ├── Calc.t.sol # Foundry tests
│   └── Calc.t.js  # Hardhat tests
├── script/        # Deployment scripts
│   └── deploy-arbitrum-sepolia.js
└── foundry.toml   # Foundry configuration
```

## Features

- **Custom Value Type**: Uses `calcParam` type for calculations
- **Basic Operations**: Addition, subtraction, multiplication, and division
- **Error Handling**: Division by zero protection
- **Event Tracking**: Emits events for all operations
- **Result Storage**: Keeps track of the latest result per address

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file in the project root with the following variables:
   ```
   PRIVATE_KEY=your_private_key_here
   ARBISCAN_API_KEY=your_arbiscan_api_key_here
   ```

## Testing

### Hardhat Tests
```bash
npx hardhat test
```

### Foundry Tests
```bash
forge test
```

## Deployment

The project includes deployment scripts for the Arbitrum Sepolia testnet:

1. Deploy the contract:
   ```bash
   npx hardhat run script/deploy-arbitrum-sepolia.js --network arbitrumSepolia
   ```

2. Verify the contract on Arbiscan:
   ```bash
   npx hardhat verify --network arbitrumSepolia <deployed_contract_address>
   ```

## Development Tools

- **Hardhat**: Main development framework
- **Foundry**: Used for Solidity testing
- **@nomicfoundation/hardhat-foundry**: Plugin to integrate Hardhat with Foundry's project structure
- **Arbitrum Sepolia**: Test network for deployment