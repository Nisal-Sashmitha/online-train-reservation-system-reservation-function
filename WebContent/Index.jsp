<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.css" >
	<link rel="stylesheet" href="css/home.css" >
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body class="bg-light">

	
    
	<nav class="navbar navbar-expand-md navbar-light bg-white fixed-top font-weight-bold mx-auto " >
	
   
		<a href="" class="navbar-brand mx-auto"><img class="mx-5" src="image/Capture.PNG"></a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#ccsl"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse justify-content-center" id="ccsl" >
			<ul class="navbar-nav">
				<li class="nav-item active mx-3"><a href="#" class="nav-link">Home</a></li>
				<li class="nav-item mx-3"><a href="#" class="nav-link">Trains</a></li>
				<li class="nav-item mx-3"><a href="#" class="nav-link">Guide</a></li>
				<li class="nav-item mx-3"><a href="#" class="nav-link">Contact Us</a></li>
				<li class="nav-item mx-3 "><a href="#" class="nav-link text-danger">MyBookings</a></li>
			</ul>
		
		
	
  	</div>	
	</nav>
	
	

	
 <header class="masthead">
  <div class="container-fluid h-100">
    <div class="row h-100 align-items-center">
    	<div class="col-lg-6  text-white d-flex justify-content-center">
        
      
    		<form class="bg-white p-5 w-50" style="min-width: 400px;" method="post" action="search" >
  				<div class="form-group align-items-left">
    				<label class="text-dark" for="exampleInputEmail1">From</label>
    				<select class="form-control" name="from" required>
  						<option>Large select</option>
  						<c:forEach var="sR" items="${stations}" >
  							<option value="${sR}">${sR}</option>
  						</c:forEach>
					</select>
  				</div>
  				<div class="form-group align-items-left">
    				<label class="text-dark" for="exampleInputEmail1">To</label>
    				<select class="form-control" name="to" required>
  						<option>Large select</option>
  						
  						<c:forEach var="sR" items="${stations}" >
  							<option value="${sR}">${sR}</option>
  						</c:forEach>
					</select>
  				</div>
  				<div class="form-group align-items-left">
    				<label class="taxt-left text-dark" for="date">Departure Date</label>
    				<input type="date" class="form-control" name="date" id="depatureDate"  min="2021-05-24" required>
  				</div>
  				
  				<button type="submit" class="btn btn-danger w-100">Search for a train</button>
			</form>
		</div>	
    
      <div class="col-lg-6 text-lg-right text-center text-white d-flex justify-content-center">
      	<div>    
        	<h1 class="font-weight-bold">greatest journey begins<br> with a single step</h1>
        	<p class="lead">come with us feel the nature</p>
      	</div>   
      </div>
    </div>
  </div>
</header>

    
	
	
	
	
	
	
	<div class="container-fluid mt-5">
	
		<div class="row" style="border:1px solid;">
			<div class="col-xl-6 col-sm-12 text-center"><h1 class="mx-auto d-block">hellow</h1></div>
			<div class="col-xl-6 col-sm-12 text-center"><h1 class="mx-auto d-block">hllooooow</h1></div>
			
		</div>
	</div>
<script>

	//take currunt date and calculate next day and assign it to date input
$(document).ready(function(){
	
	var d = new Date();
    month = '' + (d.getMonth() + 1);
    day = '' + (d.getDate()+1);
    year = d.getFullYear();

if (month.length < 2) 
    month = '0' + month;
if (day.length < 2) 
    day = '0' + day;
 
 var datt=[year, month, day].join('-');
	console.log(datt);
	$("#depatureDate").attr("min",datt);
	
	
});


</script>
	
</body>
</html>