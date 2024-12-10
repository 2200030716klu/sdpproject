<%@page import="com.klef.jfsd.lms.model.Transaction"%>
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

<%@include file="borrowernavbar.jsp"%>

<style>
  /* General page styling */
  body {
    margin: 0;
    padding: 20px;
    font-family: Arial, sans-serif;
    background: #ffffff; /* Light green background */
    color: #333;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 2rem;
    color: #2e7d32; /* Dark green */
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
  }

  /* Table container styling */
  .table-container {
    width: 90%;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    margin-top:75px; 
  }

  /* Table styling */
  table {
 
    width: 100%;
    border-collapse: collapse;
  }

  th, td {
    padding: 15px;
    text-align: center;
    font-size: 16px;
    border: 1px solid #ddd;
     background-color: #ffffff;
  }

  th {
    background-color: #bfbfbf; /* Medium green */
    text-color: white;
    font-weight: bold;
    text-transform: uppercase;
  }

  
 tr {
    background-color: #ffffff; 
  }

  td a {
    text-decoration: none;
    color: #2e7d32; /* Dark green */
    font-weight: bold;
    padding: 8px 12px;
    border-radius: 5px;
    background-color: #e8f5e9; /* Light green background */
    transition: all 0.3s ease;
  }

  td a:hover {
    background-color: #388e3c; /* Medium green */
    color: #fff;
  }

  /* Responsive design */
  @media screen and (max-width: 768px) {
    th, td {
      font-size: 14px;
      padding: 10px;
    }

    h1 {
      font-size: 1.5rem;
    }
  }
</style>


</head>

<body>

<br><br><br><br>

	<h2 align="center" style="font-family: 'Arial', sans-serif;" >My Transactions</h2>

	
	


<div class="table-container" style="margin-top: 40px;" >
    
    <table >
        <thead>
        <tr>
        	<th> Loan ID</th>
            <th> Paid To</th>
            <th> Date</th>
            <th> Time </th>
            <th> Transaction Amount</th>
          
        
        </tr>
        </thead>
        
    <c:forEach items="${transactions}" var="transaction">
	<tr>
     	
	<td> <c:out value="${transaction.loanid}"></c:out> </td>
	
	<td> <c:out value="${transaction.lendername}"></c:out> </td>
	
	<td> <c:out value="${transaction.date}"></c:out> </td>
		
	<td> <c:out value="${transaction.time}"></c:out> </td>
	
	<td> <c:out value="${transaction.transactionamount}"></c:out> </td>
		
	</tr>
	
	</c:forEach>
	</table>
	
</div>

</body>
</html>




















