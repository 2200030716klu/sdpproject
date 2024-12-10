<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrower Profile</title>

<style>
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
<%@include file="adminnavbar.jsp" %>
<br/><br/><br/><br/>
<h3 align="center">Borrower Profile</h3>
<div align="center" style="margin-top: 50px" >
<div class="profile-card" >
    <img src="admindisplaybi?id=${borrower.id}"  alt="Profile Image" class="profile-image"><br>
    <div class="line">NAME: ${borrower.name}<br/></div>
    <div class="line">GENDER : ${borrower.gender}<br/></div>
    <div class="line">DOB : ${borrower.dateofbirth}<br/></div>
    <div class="line">EMAIL : ${borrower.email}<br/></div>
    <div class="line">ADDRESS : ${borrower.address}<br/></div>
    <div class="line">EMPLOYEMENT STATUS : ${borrower.empstatus} <br/></div>
    <div class="line">ANNUAL INCOME : ${borrower.annual_income}  <br/></div>
    <div class="line">CONTACT : ${borrower.contact} <br/></div>
    <div class="line">PASSWORD : ${borrower.password} <br/></div>
    
    <a href="adminupdatebrprofile?bid=${borrower.id}">update?</a>
</div>

</div>


</div>
</body>
</html>