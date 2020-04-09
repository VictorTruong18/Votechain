package services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import block.Vote;
import blockchain.Votechain;

/**
 * Servlet implementation class ChoixMenuElecteur
 */
@WebServlet("/ChoixMenuElecteur")
public class ChoixMenuElecteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChoixMenuElecteur() {
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
		HttpSession session = request.getSession(true);
		
		switch(request.getParameter("choixMenuElecteur")) {
		case "Election Presidentiel" :
			this.getServletContext().getRequestDispatcher("/VotePresidentiel.jsp").forward(request, response);
			for(Vote v : Votechain.votes) {
				System.out.println(v.getData());
			}
			break;
		case "Voir la votechain" :
			this.getServletContext().getRequestDispatcher("/VotechainView.jsp").forward(request, response);
			break;
		
		case "Revenir au Menu" :
			this.getServletContext().getRequestDispatcher("/MenuElecteur.jsp").forward(request, response);
			break;
			
		case "Voir le Score" :
			this.getServletContext().getRequestDispatcher("/ScoreView.jsp").forward(request, response);
			break;
		}
			
	}

}
