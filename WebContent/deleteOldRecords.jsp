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
	<link rel="stylesheet" href="css/delete.css" >
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body>
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

<!------ Include the above in your HEAD tag ---------->

	<div class="wrapper fadeInDown">
			<div class="container" style="display:none;" id="myAlert">
        
        		<div class="alert alert-success alert-dismissable" id="myAlert2">
            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            			Success!  <%out.println(request.getAttribute("affectedRows")); %> number of rows affected successfully!! .
       			</div>

    		</div>
	
	
  		<div id="formContent">
    	<!-- Tabs Titles -->

    	<!-- Icon -->
    	<div class="fadeIn first text-danger">
      		<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-trash m-3" viewBox="0 0 16 16">
  				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
			</svg>
    	</div>
    	
    	<div id="formFooter" class="text-danger"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
  <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
  <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
</svg><br>
      		<span class="text-danger">This section is a really critical section. All the reservation details before the date you select will be deleted permanently!!! <br> Please attend this after making all the necessary Reports!</span>
		</div>
    	<!-- Login Form -->
    	<form class="mt-3" id="deleteForm" action="DeleteOldReservations" method="post">
    		<div class="w-100 d-flex justify-content-center">
      		<input type="date" id="date" class="form-control input-lg align-content-center fadeIn second" style="max-width:300px;" name="finalDate" required>
      		</div>
      		<input type="text" id="password" class=" form-control fadeIn third" style="max-width:300px;" name="login" placeholder="Admin PIN" required>
      		<input type="button" name="btn" value="Submit" id="submitBtn" data-toggle="modal" data-target="#confirm-submit" class="btn-danger fadeIn fourth">
      		
      		
    	</form>
    	

    	<!-- Remind Passowrd -->
    	

  </div>
</div>
	<div class="modal fade" id="confirm-submit" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                Confirm Submit
            </div>
            <div class="modal-body">
                Are you sure you want to delete all the reservation details before <span id="dateOnModel"></span> ?

                <!-- We display the details entered by the user here -->
                <div id="formFooter" class="text-danger"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
  					<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
  					<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
				</svg><br>
      		<span class="text-danger">This section is a really critical section. All the reservation details before the date you select will be deleted permanently!!! <br> Please attend this after making all the necessary Reports!</span>
		</div>
                  
                        
                   
                
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="#" id="submit" class="btn btn-success success">Yes</a>
            </div>
        </div>
    </div>
    </div>
<script>
$(document).ready(function(){
	
		   
		var status = parseInt(<%out.println(request.getAttribute("status")); %>);
		if(status==1){
		if($("#myAlert").find("div#myAlert2").length==0){
		    $("#myAlert").append("<div class='alert alert-success alert-dismissable' id='myAlert2'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
		  }
		  $("#myAlert").css("display", "");
		  
		}  
	
	   
	var d = new Date();
    d.setDate( d.getDate() - 10 );
    month = '' + (d.getMonth() + 1);
    day = '' + (d.getDate()+1);
    year = d.getFullYear();

if (month.length < 2) 
    month = '0' + month;
if (day.length < 2) 
    day = '0' + day;
 
 var datt=[year, month, day].join('-');
	console.log(datt);
	$("#date").attr("max",datt);
});


$('#submitBtn').click(function() {
    /* when the button in the form, display the entered values in the modal */
    
    $('#dateOnModel').text($('#date').val());
    
});

$('#submit').click(function(){
    /* when the submit button in the modal is clicked, submit the form */
    
   $('#deleteForm').submit();
});
</script>
</body>
</html>