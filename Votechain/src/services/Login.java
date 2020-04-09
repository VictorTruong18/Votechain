package services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blockchain.Votechain;
import blockchain.VotechainData;
import election.Electeur;

import election.ListeElectoralData;



/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String identifiant = request.getParameter("identifiant");
		String motDePasse = request.getParameter("motDePasse");
		ListeElectoralData l = new ListeElectoralData();
		
		Electeur e = l.getElecteur(identifiant, motDePasse);
		int avote;
		if(e == null) {
			this.getServletContext().getRequestDispatcher("/LoginInvalide.jsp").forward(request, response);
		} else {
			avote = l.getElecteur(identifiant, motDePasse).getAvote();
		
			
			if(avote == 0) {
				
				HttpSession session = request.getSession(true);
				session.setAttribute("electeur", e);
				session.setAttribute("electeur-name", identifiant);
				VotechainData votechainData = new VotechainData();
//				votechainData.initVotechainObject();
				Votechain v = new Votechain();
				
				this.getServletContext().getRequestDispatcher("/MenuElecteur.jsp").forward(request, response);
			}
			else {
				this.getServletContext().getRequestDispatcher("/LoginUtilisateurAVote.jsp").forward(request, response);
			}
		}
		
		
		
		
	}

}
