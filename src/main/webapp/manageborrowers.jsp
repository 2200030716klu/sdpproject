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

<%@include file="adminnavbar.jsp"%>

<style>
   
.card-container {
    display: flex;
    flex-wrap: wrap; /* Allows cards to wrap to the next row if space is insufficient */
    gap: 60px; /* Adds spacing between the cards */
    justify-content: center; /* Centers the cards horizontally */
    padding: 20px; /* Adds padding around the container */
}

  .profile-card {
 		font-family: Arial, sans-serif;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 355px;
        text-align: center;
        padding: 20px;
        transition: transform 0.3s ease;
    }

	.line
	{
		padding-bottom:10px;
	}
	
    .profile-image {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        margin-bottom: 20px;
        object-fit: cover;
    }

    .profile-button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .profile-button:hover {
        background-color: #0056b3;
    }
  </style>
</head>


<body>
<br><br><br><br>

<h3 align="center">Borrowers</h3>


<div class ="card-container">

    <c:forEach items="${borrowerslist}" var="borrower">
    
    
    <div class="profile-card" >
    <img src="admindisplaybi?id=${borrower.id}"  alt="Profile Image" class="profile-image"><br>
    <div class="line">ID: ${borrower.id}<br/></div>
    <div class="line">NAME: ${borrower.name}<br/></div>
    <div class="line">EMAIL : ${borrower.email}<br/></div>
    <div class="line">  <a href="adminupdatebrprofile?bid=${borrower.id}">Update</a> <br/></div>
    <div class="line">  <a href="deleteborrower?bid=${borrower.id}">Delete</a> <br/></div>
    
	</div>
	
    </c:forEach>

</div>

</body>
</html>




















