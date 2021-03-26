const PelotonNFT = artifacts.require('PelotonNFT')

module.exports = async (deployer, network, [defaultAccount]) => {
    // Local (development) networks need their own deployment of the LINK
    // token and the Oracle contract
    deployer.deploy(PelotonNFT)
}