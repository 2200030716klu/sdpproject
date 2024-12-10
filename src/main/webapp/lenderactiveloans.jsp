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

<%@include file="lendernavbar.jsp"%>


</head>


<body>

<br>
	<br><br>
	<br><br>
	
			<h2 align="center" style="font-family: 'Arial', sans-serif;" > Active Loans</h2>
	<br>
<div class ="container">

    <table class = "table table-striped table-bordered">
        <thead class = "table-dark">
        <tr>
        	<th> Transactions</th>
            <th> Borrower Profile</th>
            <th> Sanction Amount</th>
            <th> Interest Rate  </th>
            <th> Loan Term </th>
            <th> To Pay </th>
            <th> Paid </th>   
            <th> Due </th>
                   
        
        </tr>
        </thead>
        
    <c:forEach items="${loans}" var="loan">
	<tr>
	
	<td align="center"> <a href="lendershowtsnbyloanid?lid=${loan.id}"> <span style=""> &#8599; </span></a> </td>
	
	<td> <a href="lviewbprofile?bname=${loan.borrowername}"><c:out value="${loan.borrowername}"></c:out></a> </td>
     	
	<td> <c:out value="${loan.sanctionAmount}"></c:out> </td>
	
	<td> <c:out value="${loan.interestrate}"></c:out> </td>
		
	<td> <c:out value="${loan.loanTerm} months"></c:out> </td>
	
	<td> <c:out value="${loan.topay}"></c:out> </td>
		
	<td> <c:out value="${loan.paid}"></c:out> </td>
	
	<td> <c:out value="${loan.due}"></c:out> </td>
	
	</tr>
	</c:forEach>
	</table>
	
</div>

</body>
</html>




















