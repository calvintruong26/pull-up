<%@page import="com.pullup.User" %>
<% User user = (User) session.getAttribute("user"); %>
<!doctype html>
<html ng-app>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

			</div>
		</div>
	</nav>
	
	<div class="socialmargin" style="text-align: right">
	<a href="#"><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></a>
	<a href="#"><i class="fa fa-instagram fa-2x" aria-hidden="true"></i></a>
	<a href="#"><i class="fa fa-twitter fa-2x" aria-hidden="true"></i></a>
	</div>
	
	<h3 style="text-align: center">Sign up!</h3>
	<div class="container">
	<form action="./RegisterServlet" method="POST" name="SignUp">
		<div class="form-group row">
			<label for="example-firstname-input" class="col-xs-2 col-form-label">
				First Name</label>
			<div class="col-xs-10">
				<input class="form-control" type="name" placeholder="First Name"
					name="fname" id="example-firstname-input">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-lastname-input" class="col-xs-2 col-form-label">
				Last Name</label>
			<div class="col-xs-10">
				<input class="form-control" type="name" placeholder="Last Name"
					name="lname" id="example-lastname-input">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-address-input" class="col-xs-2 col-form-label">
				Address</label>
			<div class="col-xs-10">
				<input class="form-control" type="address" placeholder="Address"
					name="address" id="example-address-input">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-city-input" class="col-xs-2 col-form-label">
				City</label>
			<div class="col-xs-10">
				<input class="form-control" type="text" placeholder="City"
					name="city" id="example-city-input">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-state-input" class="col-xs-2 col-form-label">
				State</label>
			<div class="col-xs-10">
				<input class="form-control" type="text" placeholder="State"
					name="state" id="example-state-input">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-zipcode-input" class="col-xs-2 col-form-label">
				Zip Code</label>
			<div class="col-xs-10">
				<input class="form-control" type="text" placeholder="Zip Code"
					name="zcode" id="example-zcode-input">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="exampleInputUsername" class="col-xs-2 col-form-label">
				Username</label>
			<div class="col-xs-10">
				<input type="text" class="form-control" id="exampleInputEmail3"
					name="uname" placeholder="Username" required> </i></a>
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputPassword3" class="col-xs-2 col-form-label">
				Password</label>
			<div class="col-xs-10">
				<input type="password" class="form-control"
					id="exampleInputPassword3" name="pword" placeholder="Password"
					required>
			</div>
		</div>
		<div class="form-group row">
			<label for="examplephoneinput" class="col-xs-2 col-form-label">
				Phone Number</label>
			<div class="col-xs-10">
				<input type="text" class="form-control" id="examplephoneinput"
					name="phonenumber" placeholder="e.g. 408-567-5645" required> </i></a>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-email-input" class="col-xs-2 col-form-label">
				Email</label>
			<div class="col-xs-10">
				<input class="form-control" type="text" placeholder="Email"
					name="email" id="example-email-input">
			</div>
		</div>
		<div align="center">
			<button type="submit" class="btn btn-default">
				<span class="fa fa-check" aria-hidden="true"></span> Submit
			</button>
		</div>
	</form>
	</div>
</body>
</html>