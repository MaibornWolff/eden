const web3 = require('web3');

const config = function () {
  this.logFormat = "dev";
  this.provider = new web3.providers.HttpProvider('http://geth_mining:8545');
  this.bootstrapUrl = "https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/yeti/bootstrap.min.css";
  this.names = {};
}

module.exports = config;
