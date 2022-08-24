# Governor Module

## Architecture

The Governor Module utilizes the MVD accessControl and moduleBase to deal with permissions. 


### GovernorModule.sol

The Governor Module contract contains the methods required to create proposal, vote on proposals with an votes enabled token, and execute this transaction on an accompanying DAO. 


### GovernorModuleFactory.sol

The Governor Factory Contract contains the methods needed to deploy a proxy that is pointed to an implementation on chain. It is important this contract inherits from the ModuleBaseFactory interface so that is compatible with the metaFactory contract in the MVD.

## Local Setup & Testing

Clone the repository:
```shell
git clone ...
```

Lookup the recommended Node version to use in the .nvmrc file and install and use the correct version:
```shell
nvm install 
nvm use
```

Install necessary dependencies:
```shell
npm install
```

Add `.env` values replacing the private key and provider values for desired networks
```shell
cp .env.example .env
```

Compile contracts to create typechain files:
```shell
npm run compile
```

Run the tests
```shell
npm run test
```

## Deploy Contract to <network>
```shell
npx hardhat deploy --network <network>
```


## Local Hardhat deployment

To deploy the base Fractal contracts open a terminal and run:
```shell
npx hardhat node
```
This will deploy the following contracts and log the addresses they were deployed to:
 - Governor Implementation
 - Timelock Implementation
