<%@ page import="com.pullup.User" %>
<%@ page import="com.pullup.Listing" %>


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
<link rel="stylesheet" href="styles.css" type="text/css">

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
	
	<div class="container">
	  <form class="form-horizontal" method="POST" action="./ConfirmationServlet">
	    <fieldset>
	      <legend>Payment</legend>
	      <div class="form-group">
	        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
	        <div class="col-sm-9">
	          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
	        </div>
	      </div>
	      <div class="form-group">
	        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
	        <div class="col-sm-9">
	          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
	        </div>
	      </div>
	      <div class="form-group">
	        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
	        <div class="col-sm-9">
	          <div class="row">
	            <div class="col-xs-3">
	              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
	                <option>Month</option>
	                <option value="01">Jan (01)</option>
	                <option value="02">Feb (02)</option>
	                <option value="03">Mar (03)</option>
	                <option value="04">Apr (04)</option>
	                <option value="05">May (05)</option>
	                <option value="06">June (06)</option>
	                <option value="07">July (07)</option>
	                <option value="08">Aug (08)</option>
	                <option value="09">Sep (09)</option>
	                <option value="10">Oct (10)</option>
	                <option value="11">Nov (11)</option>
	                <option value="12">Dec (12)</option>
	              </select>
	            </div>
	            <div class="col-xs-3">
	              <select class="form-control" name="expiry-year">
	                <option value="13">2013</option>
	                <option value="14">2014</option>
	                <option value="15">2015</option>
	                <option value="16">2016</option>
	                <option value="17">2017</option>
	                <option value="18">2018</option>
	                <option value="19">2019</option>
	                <option value="20">2020</option>
	                <option value="21">2021</option>
	                <option value="22">2022</option>
	                <option value="23">2023</option>
	              </select>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="form-group">
	        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="col-sm-3">
	          <input type="hidden" name="listingID" value="<%= request.getParameter("listingID") %>">
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="col-sm-offset-3 col-sm-9">
	          <button type="submit" class="btn btn-success">Pay Now</button>
	        </div>
	      </div>
	    </fieldset>
	  </form>
	</div>
	
</body>
</html>