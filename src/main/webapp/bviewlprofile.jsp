<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lender Profile</title>

<style>
.card-container {
    display: flex;
    flex-wrap: wrap; /* Allows cards to wrap to the next row if space is insufficient */
    gap: 20px; /* Adds spacing between the cards */
    justify-content: center; /* Centers the cards horizontally */
    padding: 20px; /* Adds padding around the container */
    background-color: #f9f9f9; /* Optional: Background for better contrast */
}

  .profile-card {
 		font-family: Arial, sans-serif;
        background-color: white;
        border-radius: 0px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
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
<%@include file="borrowernavbar.jsp" %>
<br/><br/><br/><br/><br/><br/>
<h2 align="center"  style="font-family: 'Arial', sans-serif;">Lender Profile</h2>
<div align="center" style="margin-top: 50px" >
<div class="profile-card" >
    <img src="admindisplayli?id=${lender.id}"  alt="Profile Image" class="profile-image"><br>
    <div class="line">NAME: ${lender.name}<br/></div>
    <div class="line">GENDER : ${lender.gender}<br/></div>
    <div class="line">DOB : ${lender.dateofbirth}<br/></div>
    <div class="line">EMAIL : ${lender.email}<br/></div>
    <div class="line">ADDRESS : ${lender.address}<br/></div>
    <div class="line">PASSWORD : ${lender.password} <br/></div>
    
</div>

</div>


</div>
</body>
</html>