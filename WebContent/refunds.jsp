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
	<link rel="stylesheet" href="css/refunds.css" >
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
				<li class="nav-item mx-3 "><a href="adminPanel.jsp" class="nav-link text-danger">Admin panel</a></li>
			</ul>
		
		
	
  		</div>	
	</nav>
	
	
	<div class="mt-4 w-100 h-100 align-middle">x
		<div class="mt-5 w-100 h-100  mx-auto align-middle p-4">
			
		

   		 	<div class="container" style="display:none;" id="myAlert">
        
        		<div class="alert alert-success alert-dismissable" id="myAlert2">
            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            			Success! resrvation <%out.println(request.getAttribute("updatedID")); %> updated as "refunded" successfully!! .
       			</div>

    		</div>
    		<div class="input-group mb-2">
			<input type="text" id="myInput" class="form-control mb-3" style="max-width:300px;height:56px;" onkeyup="myFunction()" placeholder="Search for reservation IDs..">
            <div class="input-group-prepend mb-3">
          		<div class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search p-1" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg></div>
        	</div>
        	</div>

			<table id="myTable">
  				<tr class="header">
    				<th>reservationID</th>
    				<th>customer NIC</th>
    				<th>Email</th>
    				<th>trip ID</th>
    				<th>date</th>
    				<th>to</th>
    				<th>from</th>
    				<th>noOfchilds</th>
    				<th>noOfAdults</th>
    				<th>seatClass</th>
    				<th>totalAmmount</th>
    				
    				
  				</tr>
  			<c:forEach var="sR" items="${reservations}" >	
  				<tr>
    				<td>${sR.reservationID}</td>
    				<td>${sR.customerNIC}</td>
    				<td>${sR.email}</td>
    				<td>${sR.tripID}</td>
    				<td>${sR.date}</td>
    				<td>${sR.to}</td>
    				<td>${sR.from}</td>
    				<td>${sR.noOfchilds}</td>
    				<td>${sR.noOfAdults}</td>
    				<td>${sR.seatClass}</td>
    				<td>${sR.totalAmmount}</td>
    				<td><form action="RefundedServlet" method="post">
    				<input name="reservationID" value="${sR.reservationID}" type="hidden">
    				<button type="submit" class="btn btn-danger">marks as refunded</button></form></td>
    				
    				
  				</tr>
  				
  			</c:forEach>	
  				
			</table>
		</div>
	</div>
	
	
	<script>
		function myFunction() {
  		// Declare variables
  			var input, filter, table, tr, td, i, txtValue;
  			input = document.getElementById("myInput");
  			filter = input.value.toUpperCase();
  			table = document.getElementById("myTable");
  			tr = table.getElementsByTagName("tr");

  			// Loop through all table rows, and hide those who don't match the search query
  			for (i = 0; i < tr.length; i++) {
    			td = tr[i].getElementsByTagName("td")[0];
    			if (td) {
      				txtValue = td.textContent || td.innerText;
      				if (txtValue.toUpperCase().indexOf(filter) > -1) {
        				tr[i].style.display = "";
      				} else {
        				tr[i].style.display = "none";
      				}
    			}
  			}
		}
		$(document).ready(function(){
		   
			var status = parseInt(<%out.println(request.getAttribute("status")); %>);
			if(status==1){
			if($("#myAlert").find("div#myAlert2").length==0){
			    $("#myAlert").append("<div class='alert alert-success alert-dismissable' id='myAlert2'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
			  }
			  $("#myAlert").css("display", "");
			  
			}  
		});
		
		
	</script>
</body>
</html>