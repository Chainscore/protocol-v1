const ScoreToken = artifacts.require("ScoreToken");
const sScoreToken = artifacts.require("sScoreToken");
const ScoreProtocol = artifacts.require("ScoreProtocol");
const Identity = artifacts.require("Identity");
const IdentityFactory = artifacts.require("IdentityFactory");

const web3 = require("web3");
const fromWei = (x) => web3.utils.fromWei(x.toString());
const toWei = (x) => web3.utils.toWei(x.toString());

contract("Score", (accounts) => {
  it("should stake 10000 SCORE tokens", () =>
    ScoreToken.deployed()
    .then( async (instance) => {
      let balance = await instance.balanceOf(accounts[0]);
      assert.equal(parseInt(fromWei(balance)), 10000000000);

    }));

    it("should ask for token", () => {
      ScoreProtocol.deployed()
      .then( async (instance) => {
        await instance.getScore(0x8Ba89c364606c826f860e6526F3755d664651A18)
      })
    })
});
