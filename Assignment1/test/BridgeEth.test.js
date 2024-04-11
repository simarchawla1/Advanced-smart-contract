// BridgeEth.test.js
const BridgeEth = artifacts.require("BridgeEth");
const TokenEth = artifacts.require("TokenEth");

contract("BridgeEth", (accounts) => {
  it("should deploy the BridgeEth contract and initialize with the correct token address", async () => {
    const tokenEth = await TokenEth.new();

    const bridgeEthInstance = await BridgeEth.new(tokenEth.address);

    const bridgeTokenAddress = await bridgeEthInstance.token();

    assert.equal(
      bridgeTokenAddress,
      tokenEth.address,
      "Token address not set correctly"
    );
  });
});
