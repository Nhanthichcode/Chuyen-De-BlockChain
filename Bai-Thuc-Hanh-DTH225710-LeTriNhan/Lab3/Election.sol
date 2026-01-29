// SPDX-License-Identifier: DTH225710-Le-Tri-Nhan
pragma solidity ^0.8.0;
contract Election {
 address public owner;
 struct Candidate {
 uint id;
 string name;
 uint voteCount;
 }
 Candidate[] public candidates;
 mapping(address => bool) public hasVoted;
 address[] public voters;
 modifier onlyOwner() {
 require(msg.sender == owner, "Only owner allowed");
 _;
 }
 event VoteRecorded(address voter, uint candidateId);
 event CandidateAdded(string name);
 event ElectionReset();
 constructor() {
 owner = msg.sender;
 addCandidate("Alice");
 addCandidate("Bob");
 }
 function addCandidate(string memory _name) public 
onlyOwner {
 candidates.push(Candidate(candidates.length, _name, 
0));
 emit CandidateAdded(_name);
 }
 function vote(uint _candidateId) public {
 require(!hasVoted[msg.sender], "Already voted");
 require(_candidateId < candidates.length, "Invalid candidate");
 hasVoted[msg.sender] = true;
 voters.push(msg.sender);
 candidates[_candidateId].voteCount++;
 emit VoteRecorded(msg.sender, _candidateId);
 }
 function getCandidatesCount() public view returns (uint) 
{
 return candidates.length;
 }
 function resetElection() public onlyOwner {
 for (uint i = 0; i < voters.length; i++) {
 hasVoted[voters[i]] = false;
 }
 delete voters;
 for (uint i = 0; i < candidates.length; i++) {
 candidates[i].voteCount = 0;
 }
 emit ElectionReset();
 }
}