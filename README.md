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

mock health data server:
npm install -g json-server
json-server --watch mock-health-data.json
use this: https://my-burger-api-222.herokuapp.com/data
(it's not a burger api but I DO WHAT I CAN)

TODO:
- set up server w/ api info
- integrate LINK w api to get workouts
- create PTON token constructor/obj
- create PTON token minter
- requestTokens: if new workout, mint new tokens and send them to user
- make FE to requestTokens
- actually figure out how to integrate HealthKit api w contract
