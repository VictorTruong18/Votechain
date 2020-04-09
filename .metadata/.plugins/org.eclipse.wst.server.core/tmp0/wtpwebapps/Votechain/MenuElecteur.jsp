<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>Votechain - Menu</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="ChoixMenuElecteur">
					<span class="login100-form-title p-b-51">
						Bienvenue <%=session.getAttribute("electeur-name")  %>
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="submit" name="choixMenuElecteur" id="presidentiel" value="Election Presidentiel">
						<span class="focus-input100"></span>
					</div>
					
		
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="submit" name="choixMenuElecteur" id="blockchain" value="Voir la votechain">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="submit" name="choixMenuElecteur" id="score" value="Voir le Score">
						<span class="focus-input100"></span>
					</div>
	

				</form>
			</div>
		</div>
	</div>

</body>
</html>