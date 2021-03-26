# web3pton
let's see if I can connect my pton workouts to a smart contract

npm install

Deploy to Rinkeby
1. set up env variables (private_key + api_key)
2. truffle migrate --reset --network rinkeby

npm install -g truffle
truffle compile

Verify contract on etherscan:
truffle run verify contractName --network rinkeby --license MIT

TO-DO:
- set up api_key for etherscan


