// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IBlocVote {
    struct Candidate {
        uint id;
        string name;
        uint officeId;
        bool isValid;
        uint votes;
    }

    struct Office {
        uint id;
        string name;
        bool isValid;
        uint candidatesCount;
    }

    struct Vote {
        uint candidateId;
        uint voterId;
    }

    struct Result {
        uint candidateId;
        uint officeId;
        uint votes;
    }

    
    // administration
    function changeChairman(address _newChairman) external;
    
    // candidate
    function registerCandidate(string calldata _name, uint _officeId) external;
    function removeCandidate(uint _candidateid) external;
    function reactivateCandidate(uint _candidateId) external;

    // office
    function registerOffice(string calldata _name) external;
    function removeOffice(uint _officeId) external;
    function reactivateOffice(uint _officeId) external;
    
    // vote processing
    function castVote(uint _candidateId, uint _voterId) external;
    function getResult() external returns (Result[] memory);
    function candidateResult(uint candidateId) external view returns (uint);
}