# Define variables
PROJECT_NAME = echo-nft-battle
ARTIFACT_PATH = ./artifacts/contracts/EchoNFT.sol/EchoNFT.json
ABI_DIR = ./abi
ABI_PATH = $(ABI_DIR)/EchoNFT.json

# Define targets
.PHONY: all compile deploy extract-abi start-server clean

all: compile deploy extract-abi

compile:
	@echo "Compiling smart contracts..."
	npx hardhat compile

deploy:
	@echo "Deploying smart contracts to Sepolia network..."
	npx hardhat run scripts/deploy.js --network sepolia

extract-abi:
	@echo "Extracting ABI..."
	./scripts/extract-abi.sh

start-server:
	@echo "Starting Go server..."
	go run main.go

clean:
	@echo "Cleaning project..."
	rm -rf ./artifacts ./cache $(ABI_DIR)

# Help command
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  compile       Compile the smart contracts"
	@echo "  deploy        Deploy the smart contracts to Sepolia network"
	@echo "  extract-abi   Extract the ABI from the compiled contract"
	@echo "  start-server  Start the Go server"
	@echo "  clean         Clean the project directory"
