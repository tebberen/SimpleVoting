// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    mapping(string => uint256) public votes;

    // Oy kullanmış adresleri tut
    mapping(address => bool) public hasVoted;

    // Oy kullanmak için proposal adını gönder
    function vote(string calldata proposal) external {
        require(!hasVoted[msg.sender], "Already voted");
        votes[proposal]++;
        hasVoted[msg.sender] = true;
    }

    // Oy sayısını öğrenmek için
    function getVotes(string calldata proposal) external view returns (uint256) {
        return votes[proposal];
    }
}
