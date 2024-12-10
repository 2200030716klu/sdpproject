<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.lms.model.Lender"%>
   
<%
Lender l = (Lender)session.getAttribute("lender");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lender Profile</title>

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
<%@include file="lendernavbar.jsp" %>
<br><br><br><br><br>
<h2 align="center" style="font-family: 'Arial', sans-serif;" >My Profile</h2>

<div align="center" style="margin-top: 50px" >
<div class="profile-card" >
    <img src="displaylenderimage?id=<%=l.getId() %>"  alt="Profile Image" class="profile-image"><br>
    <div class="line">NAME : <%=l.getName() %><br/></div>
    <div class="line">GENDER : <%=l.getGender()%><br/></div>
    <div class="line">DOB : <%=l.getDateofbirth() %><br/></div>
    <div class="line">EMAIL : <%=l.getEmail() %><br/></div>
    <div class="line">ADDRESS : <%=l.getAddress() %><br/></div>
    <div class="line">CONTACT : <%=l.getContact() %><br/></div>
    
    <a href="updatelenderprofile.jsp">update?</a>
</div>

</div>



</div>
</body>
</html>