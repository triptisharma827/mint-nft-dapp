import React from 'react'; // Import the React library
import MintNFT from './components/MintNFT'; // Import the MintNFT component
import './css/app.css'; // Import the app's CSS stylesheet

// Define the main App component
function App() {
  return (
    <div className="App"> {/* The main container for the app */}
      <header className="App-header"> {/* The header section */}
        <h1>NFT Minting DApp</h1> {/* The title of the app */}
      </header>
      <main className="App-main"> {/* The main content section */}
        <img src='images/img1.png' alt='NFT' width={400}/> {/* Display an image */}
        <MintNFT /> {/* Render the MintNFT component */}
      </main>
    </div>
  );
}

export default App; // Export the App component as the default export
