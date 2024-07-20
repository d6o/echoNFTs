# Echo NFT Battle

## Overview

Echo NFT Battle is a decentralized application (dApp) that allows users to mint unique Echo NFTs and battle them against
each other on the Ethereum blockchain. Each Echo NFT has unique attributes, and users can engage in battles to determine
the strongest Echo.

## Features

- Mint unique Echo NFTs with random attributes
- Battle your Echo NFTs against others
- View the winner of each battle

## Prerequisites

- [Node.js](https://nodejs.org/)
- [Go](https://golang.org/)
- [MetaMask](https://metamask.io/)
- [Hardhat](https://hardhat.org/)

## Screenshots

![Screenshot 1](https://raw.githubusercontent.com/d6o/echoNFTs/main/.github/images/1.png)
![Screenshot 2](https://raw.githubusercontent.com/d6o/echoNFTs/main/.github/images/2.png)
![Screenshot 3](https://raw.githubusercontent.com/d6o/echoNFTs/main/.github/images/3.png)
![Screenshot 4](https://raw.githubusercontent.com/d6o/echoNFTs/main/.github/images/4.png)

## Links

- **Deployed Contract on Sepolia:** [Contract Address](https://sepolia.etherscan.io/address/0x9db635bf446ce4a7160a49d17ee69e8647a4cc66)
- **NFTs on Block Explorer:** [NFTs](https://sepolia.etherscan.io/token/0x9db635bf446ce4a7160a49d17ee69e8647a4cc66)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/d6o/echoNFTs.git
cd echoNFTs

```

2. Install dependencies:

```bash
npm install
```

3. Create a `.env` file in the root directory and add your Infura project ID and private key:

```env
INFURA_PROJECT=your_infura_project_url
PRIVATE_KEY=your_private_key
```

## Compilation and Deployment

1. Compile the smart contracts:

```bash
npx hardhat compile
```

2. Deploy the smart contracts to the Sepolia test network:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

3. Note the deployed contract address from the console output.

## Extract ABI

1. Run the provided script to extract the ABI:

```bash
./extract-abi.sh
```

## Update Frontend

1. Open `static/index.html`
2. Replace the contract address.
3. Replace the ABI using the one from `abi/EchoNFT.json`.

## Running the Backend Server

1. Start the Go server to serve the static files:

```bash
go run main.go
```

## Using the dApp

1. Open `http://localhost:3000` in your browser with MetaMask installed.
2. Connect your wallet.
3. Mint a new Echo NFT by entering a name and clicking "Mint".
4. Select your Echo NFT and click "Battle" to engage in a battle.
5. View the winner's token ID.

## Makefile Commands

To simplify the workflow, you can use the provided `Makefile` to manage the project. Here are the available commands:

- **Compile the smart contracts:**

```bash
make compile
```

- **Deploy the smart contracts to Sepolia network:**

```bash
make deploy
```

- **Extract the ABI:**

```bash
make extract-abi
```

- **Start the Go server:**

```bash
make start-server
```

- **Clean the project directory:**

```bash
make clean
```

- **Display help:**

```bash
make help
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
