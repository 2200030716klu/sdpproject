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

<%@include file="lendernavbar.jsp"%>

<style>
.container{

margin-top: 150px;

}


</style>
</head>


<body>

<br><br>
<br><br>


	
	

<h2 align="center" style="font-family: 'Arial', sans-serif;" >Sanctioned Loans</h2>

<div class ="container" style="margin-top: 50px;">

 

    <table class = "table table-striped table-bordered">
        <thead class = "table-dark">
        <tr>
            <th> Borrower Profile</th>
            <th> Transactions</th>
            <th> Sanction Amount</th>
            <th> To Pay </th>
            <th> Loan Term </th>
            <th> Interest Rate  </th>
            <th> Purpose</th>
            <th> Status </th>
        </tr>
        </thead>
        
    <c:forEach items="${loans}" var="loan">
	<tr>
	<td> <a href="lviewbprofile?bname=${loan.borrowername}"><c:out value="${loan.borrowername}"></c:out></a> </td>
	
	<td align="center"> <a href="lendershowtsnbyloanid?lid=${loan.id}"> <span style=""> &#8599; </span></a> </td>
	   	
	<td> <c:out value="${loan.sanctionAmount}"></c:out> </td>
	
	<td> <c:out value="${loan.topay}"></c:out> </td>
	
	<td> <c:out value="${loan.loanTerm} months"></c:out> </td>
	
	<td> <c:out value="${loan.interestrate}"></c:out> </td>
	
	<td> <c:out value="${loan.purpose}"></c:out> </td>
	
	<td> <c:out value="${loan.status}"></c:out> </td>
		
	</tr>
	
	</c:forEach>
	</table>
	




</div>


</body>
</html>
















