#!/bin/bash

# Define paths
ARTIFACT_PATH="./artifacts/contracts/EchoNFT.sol/EchoNFT.json"
ABI_DIR="./abi"
ABI_PATH="$ABI_DIR/EchoNFT.json"

# Check if the artifact file exists
if [ ! -f "$ARTIFACT_PATH" ]; then
  echo "Artifact file does not exist. Please compile the contracts first."
  exit 1
fi

# Create ABI directory if it does not exist
mkdir -p "$ABI_DIR"

# Extract ABI using jq
jq '.abi' "$ARTIFACT_PATH" > "$ABI_PATH"

echo "ABI extracted to $ABI_PATH"
