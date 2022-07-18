require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    solidity: "0.7.3",

    defaultNetwork: 'localhost',
    networks: {
        hardhat: {},
        localhost: {
      url: "http://23.88.68.53:8545",
      gasPrice: 2000000000,
      chainId: 29,
      accounts: []},
    }
};

