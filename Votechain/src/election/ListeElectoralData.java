package election;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ListeElectoralData {
	
	
	
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
	
	public Electeur getElecteur(String login, String password) {
		try {
			Connection co = connection();
			String reqUser = "Select * from electeur where pseudo = ? and motdepasse = ?";
			
			PreparedStatement state = co.prepareStatement(reqUser);
			state.setString(1, login);
			state.setString(2, password);
			ResultSet user = state.executeQuery();
			
			String log = "";
			String pass = "";
			int avote = 0;
			while (user.next()) {
				log = user.getString("pseudo");// 
				pass = user.getString("motdepasse");
				avote = user.getInt("avote");
			}
			
			co.close();
			if (log.isEmpty() || pass.isEmpty() || avote == 1)
				return null;
			return new Electeur(log, pass, avote);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public void aVote(String nom) {
		Connection co = connection();
		String req = "Update Electeur SET avote = 1 Where pseudo = ? ";
		PreparedStatement state;
		try {
			state = co.prepareStatement(req);
			state.setString(1,nom);
			state.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	
	
	

}
