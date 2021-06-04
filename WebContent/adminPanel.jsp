<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	<div class="container mt-4">x
		<div class="container mt-5">
		<h3 class = "text-dark mb-3">Dashboard</h3>
			<div class="container row">
			<form action="ShowReservations" method="post">
				<button type="submit" style="height:180px; width:250px;" class="btn btn-primary btn-xl m-2 ">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-archive-fill" viewBox="0 0 16 16">
  					<path d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z"/>
					</svg> Mark Refunds
				</button>
			</form>
			<a href="deleteOldRecords.jsp">
				<button type="submit" style="height:180px; width:250px;" class="btn btn-danger btn-xl m-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  					<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
					</svg> Clear Reservations
				</button>
			</a>
			</div>	
			
		</div>
	</div>
</body>
</html>