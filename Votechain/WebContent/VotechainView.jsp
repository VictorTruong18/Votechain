<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="blockchain.Votechain" %>
<%@page import="block.Vote" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Votechain - VotechainView</title>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Styles/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Styles/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Styles/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Styles/css/util.css">
	<link rel="stylesheet" type="text/css" href="Styles/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<h1>Voila la votechain <%= session.getAttribute("electeur-name") %></h1>


				<% List<Vote> votes = Votechain.votes; %>
				<% for(Vote v: votes){ %>
					
					<% String data = v.getData(); %>
					<% String hash = v.getHash(); %>
					<% String last_hash = v.getLast_hash(); %>
				
		
		
				<p>Last hash : <%= last_hash  %></p>
				<p>Vote :  <%= data %> </p>
				<p>Hash : <%= hash %></p>
		<hr>
			
		<% } %>

	<form class="login100-form validate-form flex-sb flex-w" method="post" action="ChoixMenuElecteur">
	<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="submit" name="choixMenuElecteur" id="Menu" value="Revenir au Menu">
						<span class="focus-input100"></span>
	</div>
	</form>	
	
		<!--===============================================================================================-->
	<script src="Styles/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Styles/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Styles/vendor/bootstrap/js/popper.js"></script>
	<script src="Styles/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Styles/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Styles/vendor/daterangepicker/moment.min.js"></script>
	<script src="Styles/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Styles/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Styles/js/main.js"></script>
</body>
</html>