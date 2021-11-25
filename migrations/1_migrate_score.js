// const ScoreToken = artifacts.require("ScoreToken");
// const sScoreToken = artifacts.require("sScoreToken");

// const IdentityFactory = artifacts.require("IdentityFactory");
// const Identity = artifacts.require("Identity");

// const ScoreProtocol = artifacts.require("ScoreProtocol");

// // example
// const ExampleToken = artifacts.require("ExampleToken");
// const MyFaucetDapp = artifacts.require("MyFaucetDapp");

// const { deployProxy } = require('@openzeppelin/truffle-upgrades');

// module.exports = async function (deployer) {

//     await deployer.deploy(ScoreToken);
//     let scoreTokenDeployed = await ScoreToken.deployed();
    
//     await deployer.deploy(
//         ScoreProtocol, 
//         '100000'+'000000000000000000', 
//         scoreTokenDeployed.address,
//         sScoreTokenDeployed.address,
//         '10'+'000000000000000000'
//     );
//     let scoreProtocolDeployed = await ScoreProtocol.deployed();

//     // deploy example
//     await deployer.deploy(ExampleToken);
//     let exampleTokenDeployed = await ExampleToken.deployed();

    
//     await deployer.deploy(
//         MyFaucetDapp, 
//         exampleTokenDeployed.address, 
//         scoreTokenDeployed.address,
//         scoreProtocolDeployed.address
//         );
//     let faucetDeployed = await MyFaucetDapp.deployed();


//     exampleTokenDeployed.transfer(faucetDeployed.address, '1000000000000000000000000000000000000000000000000000000000')

// };

const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const ScoreToken = artifacts.require("ChainScore");
// const ScoreTokenV2 = artifacts.require("ChainScoreV2");


module.exports = async function (deployer) {

    const instance = await deployProxy(ScoreToken, [], { deployer });
    console.log('Deployed', instance.address);
    // const existing = await ScoreToken.deployed();
    // const instance = await upgradeProxy(existing.address, ScoreTokenV2, { deployer });
    // console.log("Upgraded", instance.address);
    
};
