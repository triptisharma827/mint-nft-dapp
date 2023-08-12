import React from 'react';
import MintNFT from './components/MintNFT';
import './css/app.css';


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>NFT Minting DApp</h1>
      </header>
      <main className="App-main">
        <img src='images/img1.png' alt='NFT' width={400}/>
        <MintNFT />
      </main>
    </div>
  );
}

export default App;
