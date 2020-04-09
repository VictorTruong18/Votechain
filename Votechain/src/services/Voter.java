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
import election.ListeElectoralData;

/**
 * Servlet implementation class Voter
 */
@WebServlet("/Voter")
public class Voter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Voter() {
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
		ListeElectoralData l = new ListeElectoralData();
		
		Vote vote = new Vote((String)session.getAttribute("electeur-name"),request.getParameter("candidat"));
		
		Votechain v = new Votechain();
		v.addVote(vote);
		l.aVote((String)session.getAttribute("electeur-name"));
		this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
	}

}
