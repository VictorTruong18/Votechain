package blockchain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import block.Vote;


public class VotechainData {
	
	
	private  Connection connection() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/votechain?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC", "root", "12345678");
			return co;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public void initVotechainObject() {
		try {
			Connection co = connection();
			String reqUser = "Select * from votechain";
			PreparedStatement state = co.prepareStatement(reqUser);
			LinkedList<Vote> votes = new LinkedList<Vote>();
			ResultSet user = state.executeQuery();
			
			int id;
			String data;
			String hash;
			String last_hash;
			while (user.next()) {
				id = user.getInt(1);
				data = user.getString(2);
				hash = user.getString(3);
				last_hash = user.getString(4);
				Vote vote = new Vote(data,hash,last_hash);
				votes.add(vote);

			}
			Votechain.votes = votes;
			state.close();
			user.close();
			co.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	

	}

	public void add(Vote vote) {
		Connection co = connection();
		String data = "";
		String hash = "";
		String last_hash = "";
		String reqUser = "";
		PreparedStatement state;

		data = vote.getData();
	    hash = vote.getHash();
		last_hash = vote.getLast_hash();
		reqUser = "Insert into `votechain` (`data`,`hash`,`last_hash`) values (?,?,?)";
			try {
				state = co.prepareStatement(reqUser);
				state.setString(1, data);
				state.setString(2, hash);
				state.setString(3, last_hash);
				state.executeUpdate();
				
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	
		
	}
	
	
}
