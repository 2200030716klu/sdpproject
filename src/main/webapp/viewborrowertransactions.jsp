
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<%@include file="adminnavbar.jsp"%>
</head>


<body>
<br><br>

	
	


<div class ="container">
    <div class = "row">
        <h1>   List Loan </h1>
    </div>

    <div class = "row">
        <div class = "col-lg-3">
            <a th:href = "@{/loan/new}" class = "btn btn-primary btn-sm mb-3"> Add Loan</a>
        </div>
    </div>

 

    <table class = "table table-striped table-bordered">
        <thead class = "table-dark">
        <tr>
	        <th> ID</th>
	        <th> Loan ID </th>
	        <th> Borrower Name</th>
            <th> Lender Name</th>
            <th> Date</th>
            <th> Time</th>
            <th> Amount </th>
            
        </tr>
        </thead>
        
    <c:forEach items="${transactions}" var="transaction">
	<tr>
	
	<td> <c:out value="${transaction.id}"></c:out> </td>
	
	<td> <c:out value="${transaction.loanid}"></c:out> </td>
		
	<td> <c:out value="${transaction.borrowername}"></c:out> </td>
	
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
















