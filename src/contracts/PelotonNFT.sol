// contracts/PelotonNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract PelotonNFT is ERC721, VRFConsumerBase {
    bytes32 public keyHash; // TODO make this internal
    uint256 public vrfCoordinator;
    uint256 internal fee;
    bytes32 internal keyHash;
    uint256 public randomResult;

    struct Character {
        uint256 strength;
        uint256 speed;
        uint256 stamina;
        string name;
    }
    Character[] public characters;
    // mappings go here
    mapping(bytes32 => string) requestToCharacterName;
    mapping(bytes32 => address) requestToSender;
    mapping(bytes32 => uint256) requestToTokenId;

    constructor(address _VRFCoordinator, address _LinkToken, bytes32 _keyHash) public
    VRFConsumerBase(_VRFCoordinator, _LinkToken)
    ERC721("PelotonNFT", "PtoNFT") public {
        keyHash = _keyHash;
        vrfCoordinator = _VRFCoordinator;
        fee = 0.1*10**18; // 0.1 LINK
    }

    function requestNewRandomPelotonCharacter(uint256 userProvidedSeed, string memory name) public returns (bytes32){
        bytes32 requestId = requestRandomness(keyHash, fee, userProvidedSeed); // request a random number
        requestToCharacterName[requestId] = name;
        requestToSender[requestId] = msg.sender;
        return requestId;
    }
    function fulfillRandomness(bytes32 requestId, uint256 randomNumber) internal override {
        // define the creation of the PelotonNFT
        uint256 newId = characters.length;
        uint256 strength = (randomNumber % 100); // random number btwn 0 and 99
        uint dexterity = ((randomNumber % 10000) / 100); // using modulo to create more random numbers from just the one randomNumber
        uint256 stamina = ((randomNumber % 1000000) / 10000);
        characters.push(
            Character(
                strength,
                speed,
                stamina,
                requestToCharacterName[requestId]
            )
        );
        _safeMint(requestToSender[requestId], newId); // minting token with ERC721 safeMint
    }
}