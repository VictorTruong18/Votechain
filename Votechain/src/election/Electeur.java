package election;

public class Electeur {
	
	private String pseudo;
	private String motdepasse;
	private int avote;
	
	public Electeur(String pseudo,String motdepasse, int avote) {
		this.setPseudo(pseudo);
		this.motdepasse = motdepasse;
		this.setAvote(avote);
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public int getAvote() {
		return avote;
	}

	public void setAvote(int avote) {
		this.avote = avote;
	}
	
	
}
