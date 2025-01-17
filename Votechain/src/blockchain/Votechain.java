package blockchain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

import block.Vote;

public class Votechain {
	public static LinkedList<Vote> votes = new LinkedList<Vote>();
	public static VotechainData votechainData = new VotechainData();
	
	public Votechain() {
		Votechain.votechainData.initVotechainObject();
	}
	
	
	public void addVote(Vote vote) {
		Vote lastVote = votes.getLast();
		vote.setLast_hash(lastVote.getHash());
		votes.add(vote);
		this.votechainData.add(vote);
		
	}
	
	//Verify if the newVote is valid 
	public boolean isValid(Vote vote,Vote newVote) {
		return votes.contains(vote);
		
	}
	
	
	public boolean modifyVote(Vote vote,Vote newVote) {
		
		if (isValid(vote,newVote)) {
			int indiceVote = votes.indexOf(vote);
			votes.set(indiceVote,newVote);
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public static ArrayList<Integer> Resultat(){
		int Score1 = 0;
		int Score2 = 0;
		int Score3 = 0;
		ArrayList<Integer> resultat = new ArrayList<Integer>();
		
		for (Vote v : votes ) {
		
			if(v.getData().equals("Emmanuel Macron")) {
				
				Score1++;
			}
			if(v.getData().equals("Jean-Luc Melenchon")) {
				Score2++;
			}
			if(v.getData().equals("Marine LePen")) {
				Score3++;
			}
	
		}
		resultat.add(Score3);
		resultat.add(Score2);
		resultat.add(Score1);
		return resultat;
	}
	
	

}
