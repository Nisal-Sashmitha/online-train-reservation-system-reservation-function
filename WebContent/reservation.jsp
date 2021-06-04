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
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
	<div class="my-5">x</div>
	<div class="container w-100 d-flex justify-content-center -5"><h2 class="text-center">Reserve seats for trip From <%=request.getParameter("startFrom")%> To <%=request.getParameter("endAt") %> on <%=request.getParameter("date") %></h2></div>
	<div class="container w-100 d-flex justify-content-center -5">
		<h4 class="text-center text-danger"><span id="availableSeats"><%out.print(request.getAttribute("NoOfAvailableSeatsInTheTrainForTheClass")); %></span> out of <%=request.getAttribute("NoOfSeatInTheTrainForTheClass") %> Seats available in <%=request.getAttribute("seatclass") %>st class</h4>
	</div>
	
	<div class="container w-100 my-5 p-5">
	<form style="min-width: 400px;" method="post" action="ReserveServlet" >
  		<div class="row my-1 py-2 bg-white">
  			<div class="col-sm-4 col-4"></div>
  			<div class="col-sm-4 col-4"></div>
  			<div class="col-sm-4 col-4 d-flex justify-content-end">Rs.</div>
		</div>
		
		<div class="row my-1 py-2 bg-white">
  			<div class="col-sm-4 col-4">
  			<div class="container row w-100">
  				<span class=col-sm-6>Adult x</span>
  				
                <div class=" col-sm-6 input-group w-25 inline-block">
                     <span class="input-group-btn">
                          <button type="button" class="quantity-left-minus ticket-quantity-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                               <span class="glyphicon glyphicon-minus"></span>
                          </button>
                     </span>
                     <input type="text" id="quantity" name="quantity" class="form-control input-number" value="0" min="0" max="<%=request.getParameter("NoOfAvailableSeatsInTheTrainForTheClass") %>">
                     <span class="input-group-btn">
                          <button type="button" class="quantity-right-plus ticket-quantity-plus btn btn-danger btn-number" data-type="plus" data-field="">
                               <span class="glyphicon glyphicon-plus"></span>
                          </button>
                     </span>
                 </div>
                        
  			</div>
  			
  			</div>
  			<div class="col-sm-4 col-4 d-flex justify-content-center"><%=request.getAttribute("pricePerTicket") %>/Adult</div>
  			<div class="col-sm-4 col-4 d-flex justify-content-end">
  				<input type="text" name="adultTotal" class="no-border-my" id="adultTotal" value=0>
  			</div>
		</div>

<!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
		<div class="row my-1 py-2 bg-white">
  			<div class="col-sm-4 col-4">
  			<div class="container row w-100">
  				<span class=col-sm-6>Child x</span>
  				
                <div class=" col-sm-6 input-group w-25 inline-block">
                     <span class="input-group-btn">
                          <button type="button" class="quantity-left-minus-child ticket-quantity-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                               <span class="glyphicon glyphicon-minus"></span>
                          </button>
                     </span>
                     <input type="text" id="quantityChild" name="quantityChild" class="form-control input-number" value="0" min="0" max="<%=request.getParameter("NoOfAvailableSeatsInTheTrainForTheClass") %>">
                     <span class="input-group-btn">
                          <button type="button" class="quantity-right-plus-child ticket-quantity-plus btn btn-danger btn-number" data-type="plus" data-field="">
                               <span class="glyphicon glyphicon-plus"></span>
                          </button>
                     </span>
                 </div>
                        
  			</div>
  			</div>
  				
  					<div class="col-sm-4 col-4 d-flex justify-content-center"><%=request.getAttribute("pricePerChild") %>/Child</div>
  					<div class="col-sm-4 col-4 d-flex justify-content-end">
  						<input type="text" name="childTotal" class="no-border-my" id="childTotal" value=0>
  					</div>
  				
		</div>
		
		

<!-- Columns are always 50% wide, on mobile and desktop -->
		<div class="row my-1 py-2 bg-white">
  			<div class="col-sm-4 col-4 text-left">
  			
  				<span class=col-sm-6>Service Charge x</span>
  				<input type=text name="totPersons" class="no-border-my text-left" id="ticket-quantity" value=0 size=3>
          
                        
  			
  			
  			</div>
  			
  			<div class="col-sm-4 col-4 d-flex justify-content-center"><%=request.getAttribute("serrviceChargePerPerson") %>/Person</div>
  			<div class="col-sm-4 col-4 d-flex justify-content-end">
  				<input type="text" name="serviceTotal" class="no-border-my" id="serviceTotal" value=0>
  			</div>
		</div>
		
		
		
		
		
		<div class="row my-1 py-2 bg-white" style="border-top:1px solid #F32013;">
  			<div class="col-sm-4 col-4"></div>
  			<div class="col-sm-4 col-4 d-flex justify-content-center"><b>Total</b></div>
  			<div class="col-sm-4 col-4 d-flex justify-content-end">
  				<b><input type="text" name="fullTotal" class="no-border-my" id="fullTotal" value=0></b>
  			</div>
		</div>
		
		<div class="row my-1 mt-3 py-2 bg-white pt-5" style="border-top:1px solid #F32013;">
			<div class="col-sm-6 col-12">
				<div class="form-group row ">
    				<label for="NIC" class="col-sm-2 col-form-label">your NIC</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" id="NIC" placeholder="NIC" name="customerNIC" required>
    				</div>
  				</div>
		
			</div>
			<div class="col-sm-6 col-12">
				<div class="form-group row">
    				<label for="Email" class="col-sm-2 col-form-label">Email</label>
    				<div class="col-sm-10">
      					<input type="email" class="form-control" id="Email" placeholder="Email" name="email" required>
    				</div>
  				</div>
				
			</div>	
		</div>
		<div class="row my-1 py-2 bg-white d-flex justify-content-center" ">
			<div class="col-lg-4 col-sm-6 col-12">
				<input name="seatclass" value="<%=request.getAttribute("seatclass") %>" type="hidden">
				<input name="tripID" value="<%=request.getAttribute("tripID") %>" type="hidden">
				<input name="date" value="<%=request.getAttribute("date") %>" type="hidden">
				<input name="endAt" value="<%=request.getAttribute("endAt") %>" type="hidden">
				<input name="startFrom" value="<%=request.getAttribute("startFrom") %>" type="hidden">
				<button type="submit" class="btn btn-danger mb-2  w-100" >Reserve</button>
			</div>
		</div>
	</form>
  	</div>
  	
  	
	
  			
  		
	
	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	<script>
  	$(document).ready(function(){

  		var quantitiy=0;
  		   $('.quantity-right-plus').click(function(e){
  		        
  		        // Stop acting like a button
  		        e.preventDefault();
  		        // Get the field name
  		        var quantity = parseInt($('#quantity').val());
  		      	var personsquantity = parseInt($('#ticket-quantity').val());
  		      	var adultTotal = parseInt($('#adultTotal').val());
  		      	var serviceTotal = parseInt($('#serviceTotal').val());
  		      	var fullTotal = parseInt($('#fullTotal').val());
  		      	var availableSeats = parseInt($("#availableSeats").text());
  		        // If is not undefined
  		            
  		        if(availableSeats-1==-1){
  		        	alert("you have selected max no of seats!! no more seats are available!!");
  		        }else{
  		            $('#quantity').val(quantity + 1);
  		          	$('#ticket-quantity').val(personsquantity + 1);
  		          	$('#adultTotal').val(adultTotal + <%out.println(request.getAttribute("pricePerTicket")); %>);
  		          	$('#serviceTotal').val(serviceTotal + <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
  		          	$('#fullTotal').val(fullTotal + <%out.println(request.getAttribute("pricePerTicket")); %> + <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
  		          	$('#availableSeats').text(availableSeats - 1);
  		            // Increment
  		        }
  		    });
  		 $('.quantity-right-plus-child').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantityChild').val());
		        var personsquantity = parseInt($('#ticket-quantity').val());
		        var childTotal = parseInt($('#childTotal').val());
		        var serviceTotal = parseInt($('#serviceTotal').val());
		        var fullTotal = parseInt($('#fullTotal').val());
		        var availableSeats = parseInt($("#availableSeats").text());
		        // If is not undefined
		        
		        if(availableSeats-1==-1){
  		        	alert("you have selected max no of seats!! no more seats are available!!");
  		        }else{
		            $('#quantityChild').val(quantity + 1);
		            $('#ticket-quantity').val(personsquantity + 1);
		            $('#childTotal').val(childTotal + <%out.println(request.getAttribute("pricePerChild")); %>);
		            $('#serviceTotal').val(serviceTotal + <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
		            $('#fullTotal').val(fullTotal + <%out.println(request.getAttribute("pricePerChild")); %> + <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
		            $('#availableSeats').text(availableSeats - 1);
		            // Increment
  		        }
		    });

  		 
  		 //Adult quantity
  		     $('.quantity-left-minus').click(function(e){
  		        // Stop acting like a button
  		        e.preventDefault();
  		        // Get the field name
  		        var quantity = parseInt($('#quantity').val());
  		      	var personsquantity = parseInt($('#ticket-quantity').val());
  		      	var adultTotal = parseInt($('#adultTotal').val());
  		      	var serviceTotal = parseInt($('#serviceTotal').val());
  		      	var fullTotal = parseInt($('#fullTotal').val());
  		      	var availableSeats = parseInt($("#availableSeats").text());
  		        // If is not undefined
  		      
  		            // Increment
  		            if(quantity>0){
  		            $('#quantity').val(quantity - 1);
  		          	$('#ticket-quantity').val(personsquantity - 1);
  		          	$('#adultTotal').val(adultTotal - <%out.println(request.getAttribute("pricePerTicket")); %>);
  		          	$('#serviceTotal').val(serviceTotal - <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
  		          	$('#fullTotal').val(fullTotal - <%out.println(request.getAttribute("pricePerTicket")); %> - <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
  		          	$('#availableSeats').text(availableSeats + 1);
  		            }
  		    });
  		 
  		 //child quantity
  		     
  		   $('.quantity-left-minus-child').click(function(e){
 		        // Stop acting like a button
 		        e.preventDefault();
 		        // Get the field name
 		        var quantity = parseInt($('#quantityChild').val());
 		       	var personsquantity = parseInt($('#ticket-quantity').val());
 		       	var childTotal = parseInt($('#childTotal').val());
 		       	var serviceTotal = parseInt($('#serviceTotal').val());
 		       	var fullTotal = parseInt($('#fullTotal').val());
 		       	var availableSeats = parseInt($("#availableSeats").text());
 		        // If is not undefined
 		      
 		            // Increment
 		            if(quantity>0){
 		            $('#quantityChild').val(quantity - 1);
 		           	$('#ticket-quantity').val(personsquantity - 1);
 		           	$('#childTotal').val(childTotal - <%out.println(request.getAttribute("pricePerChild")); %>);
 		           	$('#serviceTotal').val(serviceTotal - <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
 		           	$('#fullTotal').val(fullTotal - <%out.println(request.getAttribute("pricePerChild")); %> - <%out.println(request.getAttribute("serrviceChargePerPerson")); %>);
 		           	$('#availableSeats').text(availableSeats + 1);
 		            }
 		    });
  		 
  		 
  		 
  		    
  		});
  	
  	</script>

</body>
</html>