<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #e4c1f9, #d9a7c7);
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        form legend {
            color: #5e3a87;
            border-bottom: 2px solid #b59fe2;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }

        .form-group label {
            color: #4a2b63;
            font-weight: bold;
        }

        .form-control {
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #6a4c93;
            border-color: #6a4c93;
        }

        .btn-primary:hover {
            background-color: #5e3a87;
            border-color: #5e3a87;
        }

        .checkbox label {
            color: #4a2b63;
        }

        a {
            color: #6a4c93;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <form role="form" id="RegForm" method="" action="">

                    <legend class="text-center">Register</legend>

                    <fieldset>
                        <legend>User Details</legend>

                        <div class="form-group col-md-6">
                            <label for="Student_name">Student name</label>
                            <input type="text" class="form-control" name="sname" id="student_name" placeholder="Student Name">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="Email">Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="Email">
                        </div>

                        <div class="form-group col-md-12">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="password">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone">
                        </div>

                        

                    

                        <div class="form-group col-md-6">
                            <label for="branch">Branch</label>
                            <select class="form-control" name="branch" id="branch">
                                <option>ETC</option>
                                <option>Mechanical</option>
                                <option>CSE</option>
                                <option>IT</option>
                                <option>Electrical</option>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="city">City</label>
                            <select class="form-control" name="city" id="city">
                                <option>Nagpur</option>
                                <option>Pune</option>
                                <option>Mumbai</option>
                                <option>Nashik</option>
                                <option>Akola</option>
                                <option>Amravati</option>
                                <option value="other">Other</option>
                            </select>
                        </div>


                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="" id="">
                                    I accept the <a href="#">terms and conditions</a>.
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">
                                Register
                            </button>
                            <a href="SignIn">Already have an account?</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
<script>
$(document).ready(function(){
	$("#RegForm").submit(function(event){
            //alert('test');
		event.preventDefault();
		checkEmailAndSubmit();
		//ajaxPost();
	}); 
	//for checkemail fuction 
	function checkEmailAndSubmit() {
        var email = $("#email").val();

        $.ajax({
            type: "GET",
            url: "checkEmail?email=" + email,
            success: function(response) {
                if (response === true) {
                    alert("This email is already registered. Please use a different email.");
                } else {
                    ajaxPost();
                }
            },
            error: function() {
                alert("Error checking email. Please try again.");
            }
        });
    }
	//checkemail end //
	
	function ajaxPost()
	{
		var formData = {
				sname : $("input[name='sname']").val(),
				email : $("input[name='email']").val(),
				password : $("input[name='password']").val(),
				phone : $("input[name='phone']").val(),
				branch: $("select[name='branch']").val(),
				city: $("select[name='city']").val(),
				}
			console.log(formData);
		
		//Do Post
		$.ajax({
			type : "post",
			contentType:"application/json",
			url:"savestu" ,
			data:JSON.stringify(formData) , 
			datatype:"application/text",
			success:function(data)
			{
				if(data=="success")
					{
					alert("!!! Registered  Successfully !!!!");
					//console.log("redired to login page");
                                         //window.location.href="SignIn";
					location.assign("SignIn");
					}
				
                            console.log(data);
			},
			//for email start 
			
			 error: function(xhr) {
                alert(xhr.responseText || "Something went wrong!");
            }
			
			
			
			//for email end 
		});
		//ajaxPost();
	}
 });
 
</script>
      
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
</body>
</html>
