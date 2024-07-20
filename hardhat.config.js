require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

module.exports = {
    solidity: {
        version: "0.8.20",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    networks: {
        sepolia: {
            url: `${process.env.INFURA_PROJECT}`,
            accounts: [`0x${process.env.PRIVATE_KEY}`]
        }
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY
    }
};
