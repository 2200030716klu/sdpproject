<%@page import="com.klef.jfsd.lms.model.Borrower"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loan Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<%@include file="borrowernavbar.jsp"%>

<style>
    /* General Styles */
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f3f3;
      margin: 0;
      padding: 0;
     
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

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
      padding: 10px 20px;
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
	<br><br>
	<br><br>
	
			<h2 align="center" style="font-family: 'Arial', sans-serif;" > Active Loans</h2>
	<br>

<div class ="container" >
    
 

    <table class = "table table-striped table-bordered">
        <thead class = "table-dark">
        <tr>
      		<th> Transactions</th>
      		<th> Loan ID</th>
            <th> Lender Profile</th>
            <th> Sanction Amount</th>
            <th> Interest Rate  </th>
            <th> Loan Term </th>
            <th> To Pay </th>
            <th> Paid </th>   
            <th> Due </th>
            <th> Pay </th>        
        
        </tr>
        </thead>
        
    <c:forEach items="${loans}" var="loan">
	<tr>
	
	
	<td align="center"> <a href="borrowershowtsnbyloanid?lid=${loan.id}"><span style="">&#8599;</span></a> </td>
	
	<td> <c:out value="${loan.id}"></c:out> </td>
	
	<td> <a href="bviewlprofile?lname=${loan.lendername}"><c:out value="${loan.lendername}"></c:out></a> </td>

	<td> <c:out value="${loan.sanctionAmount}"></c:out> </td>
	
	<td> <c:out value="${loan.interestrate}"></c:out> </td>
	
	<td> <c:out value="${loan.loanTerm} months"></c:out> </td>
	
	<td> <c:out value="${loan.topay}"></c:out> </td>
	
	<td> <c:out value="${loan.paid}"></c:out> </td>
	
	<td> <c:out value="${loan.due}"></c:out> </td>
	
	<td>
	 
	<a id="openPopup" class="popup-button" >Pay</a>
	
	<div id="popup" class="popup-overlay">
    <div class="popup-card">
      <h2>Enter Amount</h2>
      <form id="submitForm" action="payloan">
      
       <input type="hidden" name="lid" value="${loan.id}" readonly="true">
      
        <label for="name">Amount:</label>
        <input type="text" id="name" name="amount" placeholder="Enter amount" required>
		
        <div class="form-buttons">
          <button type="submit" class="submit-button">Pay</button>
          <button type="button" id="closePopup" class="cancel-button">Cancel</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    // Get elements
    const openPopup = document.getElementById('openPopup');
    const closePopup = document.getElementById('closePopup');
    const popup = document.getElementById('popup');

    // Open pop-up
    openPopup.addEventListener('click', () => {
      popup.style.display = 'flex';
    });

    // Close pop-up
    closePopup.addEventListener('click', () => {
      popup.style.display = 'none';
    });

   
  </script>
		</td>
	</tr>
	
	</c:forEach>
	</table>
	
</div>

</body>
</html>




















