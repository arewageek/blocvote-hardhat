import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      accounts: [
        "0x379b7e321991bbdd97115a26f1f7cb2b3929e4dd1974a81f4b939d25b6597b9d",
      ],
      url: "https://sepolia.infura.io/v3/85fb858128754127a2ff9929624e782f",
    },
    zircuit: {
      accounts: [
        "0x379b7e321991bbdd97115a26f1f7cb2b3929e4dd1974a81f4b939d25b6597b9d",
      ],
      url: "https://zircuit1.p2pify.com",
    },
    amoy: {
      accounts: [
        "0x379b7e321991bbdd97115a26f1f7cb2b3929e4dd1974a81f4b939d25b6597b9d",
      ],
      url: "https://polygon-amoy.infura.io/v3/85fb858128754127a2ff9929624e782f",
    },
  },
  etherscan: {
    apiKey: {
      sepolia: process.env.ETHERSCAN_API_KEY!,
    },
  },
};

export default config;
