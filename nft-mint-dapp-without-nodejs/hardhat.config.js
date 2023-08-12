require('@nomiclabs/hardhat-waffle');
const fs = require('fs');
const privateKey = fs.readFileSync(".secret").toString().trim();

module.exports = {
  networks: {
    hardhat: {},
    ganache: {
      url: 'http://127.0.0.1:8545', // Adjust to your Ganache settings
      accounts: ["0xf72ceaaa935cfc259264319c8c1504964caf0789c41c990f0464b2a85d9eb140",],
    },
  },
  solidity: "0.8.1", // Your preferred Solidity version
};