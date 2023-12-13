// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title A sample Raffle contract
 * @author Canberk Ege Erden
 * @notice This contract is for creating sample Raffle
 * @dev Implements Chainlink VRFv2
 */

contract Raffle {
    error Raffle__NotEnoughETHSent();

    uint256 private immutable i_enteranceFee;
    address payable[] private s_players;

    // what data structure should we use? How to keep track of all the participants?

    constructor(uint256 enteranceFee) {
        i_enteranceFee = enteranceFee;
    }

    function enterRaffle() external payable {
        //  require(msg.value >= i_enteranceFee, "Not enough ETH sent!");

        if (msg.value < i_enteranceFee) {
            revert Raffle__NotEnoughETHSent();
        }
        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {}

    /** Getter Function */

    function getEnteranceFee() public view returns (uint256) {
        return i_enteranceFee;
    }
}
