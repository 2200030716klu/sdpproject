<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Loan Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%@include file="navbar.jsp"%>


<style>


 .popup-button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #28a745;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .popup-button:hover {
      background-color: #28a745;
    }

    /* Pop-Up Overlay */
    .popup-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: none;
      justify-content: center;
      align-items: center;
      z-index: 1000;
    }

    /* Pop-Up Card */
    .popup-card {
      background: white;
      width: 90%;
      max-width: 400px;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .popup-card h2 {
      margin: 0 0 15px;
    }

    .popup-card form {
      display: flex;
      flex-direction: column;
    }

    .popup-card label {
      text-align: left;
      margin-bottom: 5px;
      font-weight: bold;
    }

    .popup-card input,
    .popup-card textarea {
      margin-bottom: 15px;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .popup-card textarea {
      resize: none;
      height: 80px;
    }

    .form-buttons {
      display: flex;
      justify-content: space-between;
    }

    .submit-button,
    .cancel-button {
      padding: 6px 18px;
      font-size: 14px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .submit-button {
      background-color: #28a745;
      color: white;
    }

    .submit-button:hover {
      background-color: #218838;
    }

    .cancel-button {
      background-color: #dc3545;
      color: white;
    }

    .cancel-button:hover {
      background-color: #c82333;
    }


</style>




</head>


<body>

	<br>
	<br>
	<div class="container" style="margin-top: 90px">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
				<h3 class="text-center" style="margin-top: 20px">Borrower
					Registration</h3>
				<div class="card-body">
					<form th:action="@{/loan/{id} (id=${loan.id})}" th:object="${loan}"
						method="post" action="insertborrower"  enctype="multipart/form-data">
						<div class="form-group">
							<label>  Name </label> <input type="text" name="bname"
								th:field="*{firstName}" class="form-control"
								placeholder="Enter Name" required/>
						</div>
						
						
						
						
						<div class="form-group">
						<labeL> Select Gender </labeL>
						
						 <select name="bgender" class="form-control" placeholder="Select Gender" required>
						    <option value="">Select</option>
						    <option value="Male">Male</option>
						    <option value="FeMale">Female</option>
						    <option value="Others">Others</option>
						  </select>
 						 </div>
 						 
 						 
 						 <div class="form-group">
							<label> Date-of-Birth </label> <input type="date" name="bdob"
								th:field="dob" class="form-control"
								placeholder="Enter Date-of-Birth" required />
						</div>
						
						
						<div class="form-group">
							<label> Email </label> <input type="text" name="bemail"
								th:field="*{email}" class="form-control"
								placeholder="Enter Email" required/>
						</div>
						
						
						
						
						
						<div class="form-group">
							<label> Address </label> <input type="text" name="baddress"
								th:field="address" class="form-control"
								placeholder="Enter Address" required/>
						</div>
						
						
						<div class="form-group">
							<label> Employement Status </label> 
							<select name="bempstatus" class="form-control" class="form-control" placeholder="Select Employement Status" required>
							<option value="">Select</option>
						    <option value="Employed">Employed</option>
						    <option value="Self Employed">Self Employed</option>
						    <option value="UnEmployed">UnEmployed</option>
						    <option value="Retired">Retired</option>
						  </select>
						</div>
						
						
						<div class="form-group">
							<label> Annual Income </label> 
							<input type="number" name="bannual_income"
								th:field="address" class="form-control"
								placeholder="Enter Annual Income" required/>
						</div>
						
						
						
						<div class="form-group">
							<label> Contact </label> <input type="text" name="bcontact" 
								th:field="*{term}" class="form-control" placeholder="Enter Contact no" required/>
						</div>
						
						<div class="form-group">
							<label> Profile Image </label> <input type="file" name="bimage" required="true"
								th:field="*{term}" class="form-control" placeholder="Upload Image" />
						</div>
						
						<div class="form-group">
							<label> Password </label> <input type="password" name="bpwd" required="true"
								th:field="*{term}" class="form-control" placeholder="Password" />
						</div>


						<div class="box-footer" align="center">
							<button  type="submit" class="btn btn-primary">
								Submit</button>
						</div>
					</form>
					
					
					
					<div id="popup" class="popup-overlay" style="display: none;">
							    <div class="popup-card">
							    <div>
							     <h4> Registered successfully</h4>
							      </div>
							      
							          <div style="margin-top: 25px;">
							          <button id="closePopup"class="submit-button">OK</button>
							          
							        </div>
							     
							    </div>
							  </div>
							  			


<script>
  // Get elements
  const popup = document.getElementById('popup');
  const closePopup = document.getElementById('closePopup');
  const form = document.querySelector('form');

  // Intercept form submission
  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent default form submission

    // Submit form via AJAX or handle it programmatically
    fetch(form.action, {
      method: form.method,
      body: new FormData(form),
    })
      .then((response) => {
        if (response.ok) {
          // Show popup on successful form submission
          popup.style.display = 'flex';
        } else {
          alert('Failed to Register. Please try again.');
        }
      })
      .catch((error) => {
        console.error('Error:', error);
        alert('An error occurred while applying for the loan.');
      });
  });

  // Close pop-up and redirect
  closePopup.addEventListener('click', () => {
    window.location.href = '/login.jsp';
  });
</script>
					
					
					

				</div>
			</div>
		</div>
	</div>
</body>
</html>