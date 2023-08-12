const express = require('express');
const { ethers } = require('ethers');
const ganache = require('ganache-cli');

// Initialize Express
const app = express();
const port = 3001; // Choose a port for your back-end

// Set up a local Ethereum provider using Ganache
const provider = new ethers.providers.Web3Provider(ganache.provider());

// Define routes and API endpoints here
app.get('/balance/:address', async (req, res) => {
  const { address } = req.params;
  const balance = await provider.getBalance(address);
  res.json({ balance: balance.toString() });
});
app.get('/', (req, res) => {
  res.send('Welcome to NFT Marketplace Backend');
  console.log("hii");
});


// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
