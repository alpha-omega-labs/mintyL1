require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    solidity: "0.8.0",

    defaultNetwork: 'genesisd',
    networks: {
        hardhat: {},
        genesisd: {
      url: "http://23.88.68.53:8545",
      gasPrice: 2000000000,
      chainId: 29,
      accounts: []},
    }
};

