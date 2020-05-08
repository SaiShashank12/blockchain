pragma solidity >=0.4.21 <0.7.0;

contract Election{
  struct Candidate{
      uint id;
      string name;
      uint voteCount;
  }
  mapping(uint=>Candidate) public candidates;
  uint public candidateCount;
  mapping(address => bool) public voters;
  constructor () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
  }
  function addCandidate(string memory _name ) private{
      candidateCount++;
      candidates[candidateCount] = Candidate(candidateCount,_name,0);
  }

   function vote (uint _candidateId) public {
        require(!voters[msg.sender]);


        require(_candidateId > 0 && _candidateId <= candidateCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}