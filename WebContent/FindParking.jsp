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
					<li><a href="NewListing.jsp"><i
							class="fa fa-plus-square-o" aria-hidden="true"> Create
								Listing</i></a></li>
					<li class="active"><a href="FindParking.jsp"><i
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
	
	<h3 style="text-align: center">Find parking!</h3>
	<br>
	<div class="container">
	<form name="FindParking" action="./ListingServlet" method="get">
		<div class="form-group row">
			<label for="example-zipcode-input" class="col-xs-2 col-form-label">
				Street Name</label>
			<div class="col-xs-10">
				<input class="form-control" type="text"
					placeholder="Street Name - Ex. San Fernando" id="example-zipcode-input" name="address">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-price-input" class="col-xs-2 col-form-label">
				Maximum Price/Hour</label>
			<div class="col-xs-10">
				<input class="form-control" type="text"
					placeholder="Price - Ex. 10" id="example-price-input" name="price">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-datetime-local-input"
				class="col-xs-2 col-form-label"> Availability From</label>
			<div class="col-xs-10">
				<input class="form-control" type="datetime-local"
					value="2017-01-01T12:00:00" id="example-datetime-local-input" name="availableFrom">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-datetime-local-input"
				class="col-xs-2 col-form-label"> Availability To</label>
			<div class="col-xs-10">
				<input class="form-control" type="datetime-local"
					value="2017-01-12T18:00:00" id="example-datetime-local-input" name="availableTill">
			</div>
		</div>
		<div align="center">
			<button type="submit" class="btn btn-success">
				<span class="fa fa-search" aria-hidden="true"></span> Search
			</button>
		</div>
		</form>
		<hr>
	</div>
	
	<div class="container">
		<div align="center">
			<h3>Click below to see all our listings</h3>
			<br>
			<form action="./PopulateAllListingsServlet" method="GET">
				<button type="submit" class="btn btn-success"><i class="fa fa-list-ul" aria-hidden="true"></i> See ALL Listings!</button>
			</form>
		</div>
	</div>
</body>
</html>