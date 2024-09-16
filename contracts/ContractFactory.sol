// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import './BlocVote.sol';

contract ContractFactory {
    BlocVote[] blocvoteContracts;

    function deploy() external returns (BlocVote) {
        BlocVote contr = new BlocVote(msg.sender);
        blocvoteContracts.push(contr);

        return contr;
    }

    function deployedContracts() external view returns (BlocVote[] memory) {
        return blocvoteContracts;
    }

    function latestDeploy() external view returns (BlocVote){
        return blocvoteContracts[blocvoteContracts.length];
    }
}