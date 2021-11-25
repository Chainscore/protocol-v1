# Chainscore Contracts

[Read the WhitePaper](https://drive.google.com/file/d/1RcLBQIde-eLaDiXD8yqXrub2jKmoOlXH/view?usp=sharing)

## Deployed Contracts on Harmony Testnet
| Contract      | Address |
| ----------- | ----------- |
| SCORE Token      | 0xb1C7C061B78e5A1545C7C5c29F3a8cBa2bE09194       |
| sSCORE Staking    | 0x25843962C58Ee50c2B8707b75A3fC50Ac54Ef164        |
| Score Protocol    | 0x052A82821BE7AbBCFde75C9dF70D7FA642Eab448        |
| Identity Factory    | 0xd6E809cAf27C43378EfEF3d24fC694A87C94D7Bb        |

Extras'

| Contract      | Address |
| ----------- | ----------- |
| Faucet Example    | 0x5C477E85604f64E39de024019Ae89c12bb22F375        |
| Demo Identity    | 0xCF674D4F1a3572e46677ACfE2549091d385BC3F7        |


## Instructions to run

NOTE: Make sure you clone all below repositories under the same folder

### Contracts

[This repository](https://github.com/Chainscore/contracts.git) contains all the deployed contracts:
- SCORE Token
- sSCORE Staking Contract
- Score Protocol
- Identity Factory Contract
- Identity 
- Example Faucet Contract


#### Clone the repo
```bash
git clone https://github.com/Chainscore/contracts.git
```
#### Install Dependencies
```bash
npm install
```
#### Deploy Contracts
```bash
truffle migrate --network oneTestnet
```

### Scorer Node
Node is responsible for listening to requests from the ScoreProtocol contract, calculating score and submitting it back.

https://github.com/Chainscore/scorer

#### Clone the repo
```bash
git clone https://github.com/Chainscore/scorer.git
```
#### Install Dependencies
```bash
npm install
```
#### Run the node
```bash
node app.js
```

### Example Client
Demonstration of submitting request for the score of a user, this request is then listened by the scorer node and a score is returned.

- Approve and transfer SCORE tokens as fees (for processing the credit score)
- 
https://github.com/Chainscore/example-client

#### Clone the repo
```bash
git clone https://github.com/Chainscore/example-client.git
```
#### Install Dependencies
```bash
npm install
```
#### Send the transaction
```bash
node app.js
```