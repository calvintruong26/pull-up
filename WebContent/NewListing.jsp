<%@ page import="com.pullup.User" %>
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
					<li class="active"><a href="NewListing.jsp"><i
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
	<a href="#"><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></a>
	<a href="#"><i class="fa fa-instagram fa-2x" aria-hidden="true"></i></a>
	<a href="#"><i class="fa fa-twitter fa-2x" aria-hidden="true"></i></a>
	</div>
	
	<h3 style="text-align: center">Create a new listing!</h3>
	<div class="container">
	<form name="NewListing"
			action="./ListingServlet" method="POST">
		<div class="form-group row">
			<label for="example-listingname-input"
				class="col-xs-2 col-form-label"> Listing Name</label>
			<div class="col-xs-10">
				<input class="form-control" type="name" name="name" placeholder="e.g. A Cool Parking Spot"
					id="example-listingname-input" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-address-input" class="col-xs-2 col-form-label">
				Address</label>
			<div class="col-xs-10">
				<input class="form-control" type="address" name="address" placeholder="e.g. 77 Seventh St"
					id="example-address-input" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-price-input" class="col-xs-2 col-form-label">
				Price/Hour</label>
			<div class="col-xs-10">
				<input class="form-control" type="price" name="price" placeholder="e.g. 5"
					id="example-price-input" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-datetime-local-input"
				class="col-xs-2 col-form-label"> Availability From</label>
			<div class="col-xs-10">
				<input class="form-control" name="available" type="datetime-local"
					value="2017-01-01T15:00:00" id="example-datetime-local-input" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-datetime-local-input"
				class="col-xs-2 col-form-label"> Availability To</label>
			<div class="col-xs-10">
				<input class="form-control" name="EndAvailable" type="datetime-local"
					value="2017-01-12T18:00:00" id="example-datetime-local-input" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="lgFormGroupInput"
				class="col-sm-2 col-form-label col-form-label-lg">
				Parking Type</label>
			<div class="col-sm-10">
				<input type="text" name="description" class="form-control form-control-lg"
					id="lgFormGroupInput" placeholder="e.g. Car/SUV/Truck" required>
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