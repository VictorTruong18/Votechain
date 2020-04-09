package tests;

import org.junit.jupiter.api.Test;

import block.Vote;
import blockchain.Votechain;

public class testVotechain {
	
	
	// You shouldn't be able to modify any vote or replace any vote by another.
	// the 'modifyVote' method takes one vote and replaces it by another.
	// this method will return a false if it couldn't change the vote.
	@Test
	public void invalidReplacementOfVote() {
		//Instancing a votechain which already has a few votes
		Votechain v = new Votechain();
		//We are taking a vote from the votechain 
		Vote previousVote = v.votes.get(3);
		
		//We are creating a false vote from a hackeur
		String authorNewVote = "hackeur";
		String dataNewVote = "Marine LePen";
		Vote newVote = new Vote(authorNewVote,dataNewVote);
		
		//Thie method modifyVote() will return false if it couldn't change the block in question
		assert(!v.modifyVote(previousVote,newVote));
		
		//It's returning false because the vote from the hacker didn't have the correct hash values
		
	}
	
	
	//You shouldn't be able to modify a vote even if you are modifying it with a Vote which is identical.
	@Test 
	public void invalidModificationIdenticalVote() {
		//Instancing a votechain which already has a few votes
		Votechain v = new Votechain();

		String authorName = "Davy";
		String data = "Marine LePen";

		Vote twinVote1 = new Vote(authorName,data);
		Vote twinVote2 = new Vote(authorName,data);
		
		v.addVote(twinVote1);
		assert(!v.modifyVote(twinVote1, twinVote2));
		
	}
	
	//I should not be able to set a new value to a existing block
	@Test
	public void invalidModificationIdentical() {
		//Instancing a votechain which already has a few votes
		Votechain v = new Votechain();
		//Changing the value of a vote
		assert(!v.votes.get(3).setData("Marine LePen"));
		//the setData method will return false if it could'nt manage to change the data
		
		
	}

}
