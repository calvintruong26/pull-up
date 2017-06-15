<%@ page import="com.pullup.User" %>
<% User user = (User) session.getAttribute("user"); %>
<!doctype html>
<html ng-app>
<head>

<title>Pull Up</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
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
				<% if (user != null)  { %>
					<li><a href="NewListing.jsp"><i
							class="fa fa-plus-square-o" aria-hidden="true"> Create
								Listing</i></a></li>
					<li><a href="FindParking.jsp"><i
							class="fa fa-search-plus" aria-hidden="true"> Find Parking</i></a></li>
					<% } else { %>
						<li><a href="WelcomePage.jsp"><i
							class="fa fa-plus-square-o" aria-hidden="true"> Create
								Listing</i></a></li>
					<li><a href="WelcomePage.jsp"><i
							class="fa fa-search-plus" aria-hidden="true"> Find Parking</i></a></li>
					<% } %>
				</ul>
			<% if (user != null) { %>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Signed in as <%= user.getFirstName() %> </a></li>
					<li><a href="./LogOutServlet">Log-out <i class="fa fa-sign-out"
							aria-hidden="true"></i></a></li>
				</ul>
			<% } else {  %>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="SignUp.jsp"><i class="fa fa-user-plus"
							aria-hidden="true"> Sign Up</i></a></li>
				</ul>
			<% } %>
			</div>
		</div>
	</nav>
	<% if (user != null) { %>
	<div class="usermargin">
			<div class="btn-group">
			<a class="btn btn-primary" href="#"><i class="fa fa-user fa-fw"></i>
				User</a> <a class="btn btn-primary dropdown-toggle"
				data-toggle="dropdown" href="#"> <span class="fa fa-caret-down"
				title="Toggle dropdown menu"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="MyListingsServlet"><i class="fa fa-pencil fa-fw"></i> My Rentals</a></li>
				<li><a href="PurchasedListingsServlet"><i class="fa fa-pencil fa-fw"></i> Upcoming Events</a></li>
			</ul>
		</div>
	</div>
	<% } %>
	<div class="socialmargin" style="text-align: right">
		<a href="#"><i class="fa fa-facebook-official fa-2x"
			aria-hidden="true"></i></a> <a href="#"><i
			class="fa fa-instagram fa-2x" aria-hidden="true"></i></a> <a href="#"><i
			class="fa fa-twitter fa-2x" aria-hidden="true"></i></a>
	</div>

	<h1 style="text-align: center">Welcome to Pull Up</h1>
	<h3 style="text-align: center">Find Parking Near You!</h3>
	<div class="imgmargin">
		<div style="text-align: center">
			<a> <img src="logo.png" height="200"
				width="250">
			</a>
		</div>
	</div>
	<p class="oblique" style="text-align: center">Take the frustration
		out of parking</p>
	<% if (user != null)  { %>
		<h1 style="text-align: center">Welcome back, <%= user.getFirstName() %>!</h1>
	<% } else { %>
	<div align="center">
		<h1 style="text-align: center">Please Sign In to Get Started!</h1>
		<form name="Login" class="form-inline"
			action="./WelcomeServlet" method="doGet">
			<!--  onSubmit="return validateForm();" action="WelcomePage.html" method="doGet">--><!--  -->
			<div class="form-group">
				<label class="sr-only" for="exampleInputUsername"> Username</label>
				<input type="text" class="form-control" id="exampleInputEmail3"
					name="uname" placeholder="Username" required> </i></a>
			</div>
			<div class="form-group">
				<label class="sr-only" for="exampleInputPassword3">Password</label>
				<input type="password" class="form-control"
					id="exampleInputPassword3" name="pword" placeholder="Password"
					required>
			</div>
			<button type="submit" class="btn btn-primary">Log In</button>
		</form>
	</div>
	<% } %>

	<script>
		function validateForm() {
			var un = document.Login.uname.value;
			var pw = document.Login.pword.value; 
			var username = "username";
			var password = "password";
			if ((un == username) && (pw == password)) {
				return true;
			} else {
				alert("Login was unsuccessful, please check your username and password");
				return false;
			}
		}
	</script>

	<div class="row" align="center">
		<div class="footer">
			<div class="col-xs-6 col-sm-3">
				<a href="https://www.linkedin.com/in/gabriel-orellana-b64520117"
					target="_blank"> <span class="glyphicon glyphicon-user fa-3x"></span>
				</a>
				<h6 style="color: white;">Gabriel Orellana</h6>
				<h6 style="color: white;">Front End Developer</h6>
			</div>
			<div class="col-xs-6 col-sm-3">
				<a href="#"> <span class="glyphicon glyphicon-user fa-3x"></span>
				</a>
				<h6 style="color: white;">Steven Gonzalez</h6>
				<h6 style="color: white;">Product Manager</h6>
			</div>
			<div class="clearfix visible-xs-block"></div>

			<div class="col-xs-6 col-sm-3">
				<a href="#"> <span class="glyphicon glyphicon-user fa-3x"></span>
				</a>
				<h6 style="color: white;">Calvin Truong</h6>
				<h6 style="color: white;">General Developer</h6>
			</div>
			<div class="col-xs-6 col-sm-3">
				<a href="#"> <span class="glyphicon glyphicon-user fa-3x"></span>
				</a>
				<h6 style="color: white;">Borum Chhay</h6>
				<h6 style="color: white;">Back End Developer</h6>
			</div>
		</div>
	</div>
</body>
</html>