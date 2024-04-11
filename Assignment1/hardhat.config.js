/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    hardhat: {
      chainId: 1337, // Hardhat Network chain id
    },
    // Add configurations for other networks (e.g., ropsten, mainnet) if needed
    // ropsten: {
    //   url: `https://ropsten.infura.io/v3/${process.env.INFURA_API_KEY}`,
    //   accounts: [`0x${process.env.DEPLOYER_PRIVATE_KEY}`],
    // },
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  },
  mocha: {
    timeout: 20000, // Increase timeout for slower networks or complex tests
  },
  // Add other plugins or configurations as needed
  // For example, for etherscan verification:
  // etherscan: {
  //   apiKey: process.env.ETHERSCAN_API_KEY,
  // },
};
