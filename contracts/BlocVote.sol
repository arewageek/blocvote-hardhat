// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {IBlocVote} from './interface/IBlocVote.sol';

contract BlocVote is IBlocVote {
    address public immutable deployer = msg.sender;
    address public chairman;

    Vote[] public votes;
    Candidate[] public candidates;
    Office[] public offices;

    modifier OnlyChairman() {
        require(msg.sender == chairman, "unauthorized");
        _;
    }

    constructor(address _deployer) {
        chairman = _deployer;
    }

    function changeChairman(address _newChairman) external OnlyChairman() {
        chairman = _newChairman;
    }

    // candidate operation

    function registerCandidate(string calldata _name, uint _officeId) external {
        uint index = candidates.length;
        Candidate memory candidate = Candidate({
            name: _name,
            officeId: _officeId,
            votes: 0,
            id: index,
            isValid: true
        });

        uint candidateCountForOffice = offices[_officeId].candidatesCount;

        offices[_officeId].candidatesCount = candidateCountForOffice++;
        candidates.push(candidate);
    }

    function removeCandidate(uint _candidateId) external {
        candidates[_candidateId].isValid = false;
    }

    function reactivateCandidate(uint _candidateId) external {
        candidates[_candidateId].isValid = true;
    }

    // office operation

    function registerOffice(string calldata _name) external {
        uint index = offices.length;

        Office memory office = Office({
            id: index,
            name: _name,
            isValid: true,
            candidatesCount: 0
        });

        offices.push(office);
    }

    function removeOffice(uint _officeId) external {
        offices[_officeId].isValid = false;
    }

    function reactivateOffice(uint _officeId) external {
        offices[_officeId].isValid = true;
    }

    // voting process
    function castVote(uint _candidateId, uint _voterId) external {
        votes.push(Vote(_candidateId, _voterId));
        // candidates[_candidateId].votes ++;
    }

    function candidateResult(uint _candidateId) external view returns (uint) {
        uint _votes = candidates[_candidateId].votes;
        return _votes;
    }

    function getResult() external view returns (Result[] memory) {
        Result[] memory results = new Result[](candidates.length);

        for (uint _index; _index < candidates.length; _index++) {
            if (candidates[_index].isValid) {
                results[_index] = Result({
                    candidateId: _index,
                    officeId: candidates[_index].officeId,
                    votes: candidates[_index].votes
                });
            }
        }
        return results;
    }
}