<%@ page import="com.pullup.User" %>
<% User user = (User) request.getAttribute("user"); %>
<!doctype html>
<html ng-app>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
<title>Pull Up</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="WelcomePage.jsp"><i
					class="fa fa-car" aria-hidden="true"></i> Pull Up</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="NewListing.jsp"><i
							class="fa fa-plus-square-o" aria-hidden="true"> Create
								Listing</i></a></li>
					<li><a href="FindParking.jsp"><i
							class="fa fa-search-plus" aria-hidden="true"> Find Parking</i></a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="./LogOutServlet">Log-out <i class="fa fa-sign-out"
							aria-hidden="true"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="socialmargin" style="text-align: right">
		<a href="#"><i class="fa fa-facebook-official fa-2x"
			aria-hidden="true"></i></a> <a href="#"><i
			class="fa fa-instagram fa-2x" aria-hidden="true"></i></a> <a href="#"><i
			class="fa fa-twitter fa-2x" aria-hidden="true"></i></a>
	</div>
	<h3 style="text-align: center">Available parking near your area!</h3>
	<nav aria-label="...">
		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</nav>
</body>
</html>