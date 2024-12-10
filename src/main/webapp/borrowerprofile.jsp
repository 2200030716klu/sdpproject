<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.lms.model.Borrower"%>
   
<%
Borrower b= (Borrower)session.getAttribute("borrower");
%>    
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
<%@include file="borrowernavbar.jsp" %>

<br><br><br><br><br><br>
<h2 align="center" style="font-family: 'Arial', sans-serif;" >My Profile</h2>

<div align="center" style="margin-top: 40px" >
<div class="profile-card" >
    <img src="displayborrowerimage?id=<%=b.getId() %>"  alt="Profile Image" class="profile-image"><br>
    <div class="line">NAME : <%=b.getName() %><br/></div>
    <div class="line">GENDER : <%=b.getGender()%><br/></div>
    <div class="line">DOB : <%=b.getDateofbirth() %><br/></div>
    <div class="line">EMAIL : <%=b.getEmail() %><br/></div>
    <div class="line">ADDRESS : <%=b.getAddress() %><br/></div>
    <div class="line">EMPLOYEMENT STATUS : <%=b.getEmpstatus() %><br/></div>
    <div class="line">ANNUAL INCOME : <%=b.getAnnual_income() %><br/></div>
    <div class="line">CONTACT : <%=b.getContact() %><br/></div>
    
    <a href="updateborrowerprofile.jsp">update?</a>
</div>

</div>


</body>
</html>