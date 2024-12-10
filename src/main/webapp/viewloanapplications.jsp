
<%@page import="com.klef.jfsd.lms.model.Loan"%>
<%@page import="com.klef.jfsd.lms.model.Lender"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Lender lender= (Lender)session.getAttribute("lender");
       
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

<%@include file="lendernavbar.jsp"%>
</head>


<body>

<br><br><br><br><br>

	<h2 align="center" style="font-family: 'Arial', sans-serif;" >Borrower Loan Applications</h2>
	

<div class ="container">
    <br>
    

    <table class = "table table-striped table-bordered">
        <thead class = "table-dark">
        <tr>
            <th> Borrower Profile</th>
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

	<td> <c:out value="${loan.sanctionAmount}"></c:out> </td>
	
	<td> <c:out value="${loan.topay}"></c:out> </td>
	
	<td> <c:out value="${loan.loanTerm} months"></c:out> </td>
	
	<td> <c:out value="${loan.interestrate}"></c:out> </td>
	
	<td> <c:out value="${loan.purpose}"></c:out> </td>
	
        <td> 

<c:choose>
    <c:when test="${loan.status == 'Pending'}">
        <c:url var="approveLoanUrl" value="approveloan">
            <c:param name="id" value="${loan.id}" />
            <c:param name="lenderName" value="<%= lender.getName() %>" />
        </c:url>
        <a href="${approveLoanUrl}" class="btn btn-success">Sanction Loan</a>
    </c:when>
    <c:otherwise>
        <span class="text-muted">Approved</span>
    </c:otherwise>
</c:choose>
       </td>   
            
            
	</tr>
	
	</c:forEach>
	</table>
	




</div>


</body>
</html>





