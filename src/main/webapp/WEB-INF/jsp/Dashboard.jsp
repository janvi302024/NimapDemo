<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .report-container {
            margin: 20px;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 5px;
            position: relative;
            width: 100%;
            bottom: 0;
        }

        .table {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-custom {
            width: 80px;
            margin: 2px;
        }
        #updateFormContainer {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        background: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        /* display: none; */
    }

    #updateFormContainer h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #4CAF50;
    }

    #updateForm .form-control {
        border-radius: 5px;
        border: 1px solid #ccc;
        padding: 10px;
    }

    #updateForm button {
        width: 100px;
        margin: 5px;
    }

    #updateFormContainer {
        cursor: pointer;
    }
    </style>
</head>
<body>

<header>
    <h1>Simple Dashboard</h1>
</header>


<!--  for update  -->
<div id="updateFormContainer">
    <h3>Update Student</h3>
    <form id="updateForm">
        <input type="hidden" id="sid">
        <div class="mb-3">
            <label>Name</label>
            <input type="text" id="sname" class="form-control">
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" id="email" class="form-control">
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="password" id="password" class="form-control">
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" id="phone" class="form-control">
        </div>
        <div class="mb-3">
            <label>Branch</label>
            
            <select class="form-control" name="branch" id="branch">
                                <option>ETC</option>
                                <option>Mechanical</option>
                                <option>CSE</option>
                                <option>IT</option>
                                <option>Electrical</option>
                            </select>
        </div>
        <div class="mb-3">
            <label>City</label>
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
        
        <button type="submit" class="btn btn-success">Update</button>
        <button type="button" class="btn btn-secondary" id="closeForm">Close</button>
        
    </form>
</div>

<!-- for view  -->
<div class="report-container">
    <div class="report-body">
        <table class="table table-striped table-bordered table-hover" id="tabl">
            <thead>
                <tr>
                    <th scope="col">SID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Branch</th>
                    <th scope="col">City</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data will be inserted here -->
            </tbody>
        </table>
    </div> 
</div> 





<footer>
    <p>&copy; 2025 Your Company</p>
</footer>

<script>
    $(document).ready(function () {
        $.ajax({
            url: "userdetails", 
            method: "GET",      
            dataType: "json",    
            success: function (data) {
                $("#tabl tbody").empty();

                data.forEach(function (item) {
                    $("#tabl tbody").append(
                        '<tr>' +
                        '<td>' + item.sid + '</td>' +
                        '<td>' + item.sname + '</td>' +
                        '<td>' + item.email + '</td>' +
                        '<td>' + item.password + '</td>' +
                        '<td>' + item.phone + '</td>' +
                        '<td>' + item.branch + '</td>' +
                        '<td>' + item.city + '</td>' +
                        '<td>' +
                        '<button type="button" class="btn btn-warning btn-custom getvalues editBtn">Edit</button>' +
                        '<button type="button" class="btn btn-danger btn-custom getid">Delete</button>' +
                    '</td>' +
                    '</tr>'
                    );
                });
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data: ", error);
            }
        });
    //});
    //for Delete
     $(document).on('click', '.getid', function() {
        console.log("Delete button clicked!");
        var row = $(this).closest('tr');
        var id = row.find('td:eq(0)').text();
        console.log("ID: " + id);

        $.ajax({
            type: "POST",  
            contentType: "application/json",
            url: "deleteuser/" + id,  
            dataType: "text",
            success: function(data) {
                location.reload();  

                if (data == "deleted") {
                    alert("Data Deleted Successfully");
                }
                console.log(data);
            },
            error: function(xhr, status, error) {
                console.error("Error deleting data: ", error);
            }
        });
    });
//});

//for update 
$(document).on('click', '.editBtn', function () {
            var row = $(this).closest('tr');
            $('#sid').val(row.find('td:eq(0)').text());
            $('#sname').val(row.find('td:eq(1)').text());
            $('#email').val(row.find('td:eq(2)').text());
            $('#password').val(row.find('td:eq(3)').text());
            $('#phone').val(row.find('td:eq(4)').text());
            $('#branch').val(row.find('td:eq(5)').text());
            // For the select dropdown
            //let branchValue = row.find('td:eq(5)').text().trim(); 
            //$('#branch').val(branchValue).change(); 
            $('#city').val(row.find('td:eq(6)').text());
            $('#updateFormContainer').show();
        });

        $('#closeForm').click(function () {
            $('#updateFormContainer').hide();
        });

        $('#updateForm').submit(function (e) {
            e.preventDefault();
            var student = {
                sname: $('#sname').val(),
                email: $('#email').val(),
                password: $('#password').val(),
                phone: $('#phone').val(),
                branch: $('#branch').val(),
                city: $('#city').val()
            };
            
            var id = $('#sid').val();
            $.ajax({
                url: "updatestudent/" + id,
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(student),
                success: function () {
                    alert("Student updated successfully");
                    location.reload();
                },
                error: function () {
                    alert("Error updating student");
                }
            });
        });
    });
    
</script>

</body>
</html>
