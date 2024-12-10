<%@page import="com.klef.jfsd.lms.model.Borrower"%>
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

<br>
	<br>

	
	


<div class ="container">
   

 

    <table class = "table table-striped table-bordered" style="margin-top: 130px;">
        <thead class = "table-dark">
        <tr>
       		<th> ID </th>
        	<th> Borrower Name</th>
            <th> Lender Name</th>
            <th> Sanction Amount</th>
            <th> To Pay </th>
            <th> Loan Term </th>
            <th> Interest Rate  </th>
            <th> Purpose</th>
            <th> Status </th>
            <th> Action </th>
        </tr>
        </thead>
        
    <c:forEach items="${loans}" var="loan">
	<tr>
	
	<td> <c:out value="${loan.id}"></c:out> </td>
	
	<td> <c:out value="${loan.borrowername}"></c:out> </td>
	
	<td> <c:out value="${loan.lendername}"></c:out> </td>
     	
	<td> <c:out value="${loan.sanctionAmount}"></c:out> </td>
	
	<td> <c:out value="${loan.topay}"></c:out> </td>
	
	<td> <c:out value="${loan.loanTerm} months"></c:out> </td>
	
	<td> <c:out value="${loan.interestrate}"></c:out> </td>
	
	<td> <c:out value="${loan.purpose}"></c:out> </td>
	
	<td> <c:out value="${loan.status}"></c:out> </td>
	
	
	<td>  <a href="deleteloan?loanid=${loan.id}">Delete</a> </td>
		
	</tr>
	
	</c:forEach>
	</table>
	




</div>


</body>
</html>
















