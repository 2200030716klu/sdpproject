<%@page import="com.klef.jfsd.lms.model.Borrower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
Borrower b= (Borrower)session.getAttribute("borrower");
%>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%@include file="borrowernavbar.jsp"%>

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
				<h3 class="text-center" style="margin-top: 20px">Loan Application</h3>
				
				<div class="card-body">
					<form th:action="@{/loan/{id} (id=${loan.id})}" th:object="${loan}"
						method="post" action="insertloan" >
						<div class="form-group">
							<label>  Name </label> 
							<input type="text" name="bname"
								 class="form-control"
								value=<%=b.getName().replace(" ", "&nbsp;") %>  readonly="true"/>
								
						</div>
						
						
					
 						 
 						 <div class="form-group">
							<label> Amount </label> <input type="number" name="samount"  required="true"
								th:field="dob" class="form-control"
								placeholder="Enter Amount" />
						</div>
						
						
						
						<div class="form-group">
							<label> Time Period </label> <input type="number" name="loanterm"
								th:field="dob" class="form-control"
								placeholder="Enter Time Period(in Months)" />
						</div>
						
						
						<div class="form-group">
							<label> Purpose </label> <input type="text" name="purpose"
								th:field="purpose" class="form-control"
								placeholder="Enter Purpose of loan" />
						</div>
						
						
						<div class="form-group">
							<label> Interest </label> <input type="number" name="interestrate" step="0.1"
								th:field="interestrate" class="form-control"
								placeholder="Desired Interest Rate per Month (in %)" />
						</div>
				
						


						<div class="box-footer" align="center">
							<button  type="submit" class="btn btn-primary" id="applyButton">
								Apply</button>
						</div>
						
						
				</div>
				
				</form>
				
				
				
				
							<div id="popup" class="popup-overlay" style="display: none;">
							    <div class="popup-card">
							    <div>
							     <h4> Loan applied successfully</h4>
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
          alert('Failed to apply for the loan. Please try again.');
        }
      })
      .catch((error) => {
        console.error('Error:', error);
        alert('An error occurred while applying for the loan.');
      });
  });

  // Close pop-up and redirect
  closePopup.addEventListener('click', () => {
    window.location.href = 'myloanrequests';
  });
</script>

				
				
				
				
			</div>
		</div>
	</div>


</body>






</html>