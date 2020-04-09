<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Votechain - Election Presidentielle</title>
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
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
					<span class="login100-form-title p-b-51">
						Election Presidentielle !
					</span>

					<form method="post" action="Voter">
					<h1>Emmanuel Macron</h1>
					<img src="https://cdn-media.rtl.fr/cache/U998xPBQ7Y4YS7gPtvgYGA/880v587-0/online/image/2020/0316/7800265502_emmanuel-macron-le-16-mars-2020.jpg" style="max-height:350px; max-width: 250px;"/>
						<div class="wrap-input100 validate-input m-b-16">
							<input class="input100" type="submit" name="voter" id="voter" value="voter">
							<input type="hidden" name="candidat" value="Emmanuel Macron">
							<span class="focus-input100"></span>
						</div>
					</form>
					
					<form method="post" action="Voter">
					<h1>Marine LePen</h1>
					<img src="https://pbs.twimg.com/profile_images/1186216012586389504/VQQBnTI-_400x400.jpg" style="max-height:350px; max-width: 250px;"/>
						<div class="wrap-input100 validate-input m-b-16">
							<input class="input100" type="submit" name="voter" id="voter" value="voter">
							<input type="hidden" name="candidat" value="Marine LePen">
							<span class="focus-input100"></span>
						</div>
					</form>
					
					
					<form method="post" action="Voter">
					<h1>Jean-Luc Melanchon</h1>
					<img src="https://medias.liberation.fr/photo/1280462-prodlibe-2019-1660-insertion-page-10-jean-luc-melenchon.jpg?modified_at=1576610580&width=960" style="max-height:350px; max-width: 250px;"/>
						<div class="wrap-input100 validate-input m-b-16">
							<input class="input100" type="submit" name="voter" id="voter" value="voter">
							<input type="hidden" name="candidat" value="Jean-Luc Melenchon">
							<span class="focus-input100"></span>
						</div>
					</form>
					

					<form class="login100-form validate-form flex-sb flex-w" method="post" action="ChoixMenuElecteur">
						<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="submit" name="choixMenuElecteur" id="Menu" value="Revenir au Menu">
						<span class="focus-input100"></span>
					</div>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
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