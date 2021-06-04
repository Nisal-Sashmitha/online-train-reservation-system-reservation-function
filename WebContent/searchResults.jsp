<%@page import="com.Reservation.ReservationDBUtill"%>
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
	
	
	<!-- nav bar================================================================================================================ -->

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

	<!--search box================================================================================================================-->
	<div class="container w-100 d-flex justify-content-center mt-5">
	<form class="bg-white p-5 w-100 mt-5 d-flex justify-content-center row" style="min-width: 400px;" method="post" action="search" >
  			<div class="col-xl ml-lg-3 col-lg-4 ">
      			<div class="input-group mb-2">
        				<div class="input-group-prepend">
          					<div class="input-group-text">From</div>
        				</div>
        				<select class="form-control" name="from" required>
  							<option>Large select</option>
  							<c:forEach var="sR" items="${stations}" >
  							<option value="${sR}">${sR}</option>
  						</c:forEach>
  							
  							
						</select>
      			</div>
    		</div>
    		<div class="col-xl ml-lg-2 col-lg-4">
      				<div class="input-group mb-2">
        				<div class="input-group-prepend">
          					<div class="input-group-text">To</div>
        				</div>
        				<select class="form-control" name="to" required>
  							<option>Large select</option>
  							<c:forEach var="sR" items="${stations}" >
  							<option value="${sR}">${sR}</option>
  						</c:forEach>
						</select>
      				</div>
    		</div>
    		<div class="form-group col-xl col-lg-4  ml-lg-2">
    				
    				<div class="input-group mb-2 mx-auto">
        				<div class="input-group-prepend">
          					<div class="input-group-text">Date</div>
        				</div>
        				<input type="date" class="form-control" name="date" id="depatureDate" style="min-width: 140px;" required>
      				</div>
  			</div>
    
    		<div class="col-xl col-lg-4  ml-lg-2" >
      			<button type="submit" class="btn btn-danger mb-2 w-lg-75 w-100">Search for a train</button>
    		</div>
  		
	</form>
	</div>
	
	
	
	
	<!--search Results=============================================================================================================-->
	<div class="mt-5">
	<div id="title"  class="container w-100 d-flex justify-content-center"><h2 class="text-center">Available Trips From <%=request.getParameter("from")%> To <%=request.getParameter("to")%> on ${date}</h2></div>
	<div id="title2" style="visibility: hidden;" class="container w-100 d-flex justify-content-center"><h2 class="text-center">No trips Available From <%=request.getParameter("from")%> To <%=request.getParameter("to")%> on ${date}</h2></div>
	</div>
	
	<c:forEach var="sR" items="${searchResults}" >
	
		
		<div class="container">
  			
  			<%int count = 0; %>
  			<div class="card bg-white text-dark mb-3">
    			<div class="card-body">
    				<div class="container d-flex justify-content-center"><h5 class="text-primary">Trip:${sR.tripID}</h5></div>
    				<hr class="w-100">
    				<div class="container row w-100 d-flex justify-content-center">
						<div class="col-md text-center"><span class="text-primary  ">Train :</span>${sR.trainID}</div>
						<div class="col-md text-center"><span class="text-primary ">Frequency :</span>${sR.frequency}</div>
						<div class="col-md text-center"><span class="text-primary">Type :</span>${sR.type}</div>
					</div><br>
					<div class="container row w-100  d-flex justify-content-center">	
						<div class="col-md text-center"><span class="text-primary ">Arrivel to ${sR.startFrom} :</span>${sR.arrivelTIme}</div>
						<div class="col-md text-center"><span class="text-primary ">Departure From ${sR.startFrom} :</span>${sR.departureTime}</div>
						<div class="col-md text-center"><span class="text-primary "></span></div>
					</div>
					
					<div class="container row justify-content-around mt-3">
						
							
							<c:set var="tripID" value="${sR.tripID}"/>
							<c:set var="trainID" value="${sR.trainID}"/>
							
							<% 
							String date = request.getParameter("date");
							int tripID = (int)pageContext.getAttribute("tripID");
							int trainID =(int)pageContext.getAttribute("trainID");
							int firstclass=1;
							int secondclass=2;
							%>
							
							
							
        						<div class="input-group-prepend col-md-6 col-12 d-flex justify-content-center mt-2">
        							<form action="ReservationServlet" method="post" class="w-100 d-flex justify-content-center">
          							<div class="input-group-text">
          							<%
										out.print(ReservationDBUtill.noOfAvailableSeats(tripID, trainID,date , firstclass));
										out.println(" seats left out of "+ReservationDBUtill.getNoOfSeatsInAClassInTrain(trainID, firstclass));
									%>
									</div>
									
										<input name="tripID" value="${sR.tripID}" type="hidden">
										<input name="trainID" value="${sR.trainID}" type="hidden">
										<input name="freequency" value="${sR.frequency}" type="hidden">
										<input name="type" value="${sR.type}" type="hidden">
										<input name="arrivelTime" value="${sR.arrivelTIme}" type="hidden">
										<input name="departureTime" value="${sR.departureTime}" type="hidden">
										<input name="startFrom" value="${sR.startFrom}" type="hidden">
										<input name="endAt" value="${sR.endAt}" type="hidden">
										<input name="date" value="${date}" type="hidden">
										<input name="seatclass" value="1" type="hidden">
										<button type="submit" class="btn btn-danger">Reserve 1st class</button>
									</form>
        						</div>
        						
      						
      						
							
							
        						<div class="input-group-prepend col-md-6 col-12 d-flex justify-content-center mt-2">
        							<form action="ReservationServlet" method="post" class="w-100 d-flex justify-content-center">
          							<div class="input-group-text">
          							<%
										out.print(ReservationDBUtill.noOfAvailableSeats(tripID, trainID,date , secondclass));
										out.println(" seats left out of "+ReservationDBUtill.getNoOfSeatsInAClassInTrain(trainID, secondclass));
									%>
									</div>
									
									
										<input name="tripID" value="${sR.tripID}" type="hidden">
										<input name="trainID" value="${sR.trainID}" type="hidden">
										<input name="freequency" value="${sR.frequency}" type="hidden">
										<input name="type" value="${sR.type}" type="hidden">
										<input name="arrivelTime" value="${sR.arrivelTIme}" type="hidden">
										<input name="departureTime" value="${sR.departureTime}" type="hidden">
										<input name="startFrom" value="${sR.startFrom}" type="hidden">
										<input name="endAt" value="${sR.endAt}" type="hidden">
										<input name="date" value="${date}" type="hidden">
										<input name="seatclass" value="2" type="hidden">
										<button type="submit" class="btn btn-danger">Reserve 2nd class</button>
									</form>	
        						</div>
        						
      						
							
							
						
					</div>
					
				</div>
  			</div>
  		</div>
  	</c:forEach>
  	
  	
  	<script>

	
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
	
	var arr = ${searchResults};
console.log(arr.length)	;
 if(arr.length==0){
	 document.getElementById("title").style.visibility = "hidden";
	 document.getElementById("title2").style.visibility = "visible";
		
 }	

 
 
 
 
});


</script>

</body>
</html>