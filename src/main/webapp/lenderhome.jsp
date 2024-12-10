<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.klef.jfsd.lms.model.Lender"%>
   
<%
Lender l= (Lender)session.getAttribute("lender");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="lendernavbar.jsp"%>
<style>

body{
 height: 100%;
    margin: 0;
    
 
   }
   
   .img
   {
    height: 500px;
    margin: 0;
      background: url('img/stockphoto.jpeg'); /* Image path */
	  background-size: 100% 420px;
    background-repeat: no-repeat;
   background-position:top;
   overflow: hidden; 
   
   }
   
   
   .container {
    position: absolute;
    margin-top:20px;
    width: 100%;
     justify-content: space-evenly;
    flex-wrap: wrap; 
    display: flex;
    justify-content: space-evenly;
}
   .container a {
    text-decoration: none;
  }
   
.card {
    width: 350px;
    background: #fff;
    border-radius: 0px;
    overflow: hidden;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
 


.card-image img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    padding: 20px;
    text-align: center;
}

.card-title {
font-family: 'Poppins', sans-serif;
    font-size: 1.5rem;
    margin: 0 0 10px;
    color: #333;
}

.card-text {
font-family: 'Poppins', sans-serif;
    font-size: 1rem;
    color: #777;
    margin-bottom: 20px;
    line-height: 1.5;
}

.card-button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 1rem;
    font-weight: bold;
    color: #fff;
    background: #007bff;
    text-decoration: none;
    border-radius: 25px;
    transition: background 0.3s ease;
}

.card-button:hover {
    background: #0056b3;
}

</style>
</head>
<body>

<div class="img">
<h1 style="color: white;font-size:38px; text-align: center; margin-top: 15%;font-family:'Poppins', sans-serif;">Welcome <%=l.getName()  %></h1>

</div>

<div class="container">
 <a href="viewloanapplications">
 <div class="card">

        <div class="card-content">
            <h3 class="card-title"> Loan Applications</h3>
            <p class="card-text">
                Loan Applications
            </p>
        </div>
    </div>
    </a>
    
    <a href="lenderactiveloans" >
     <div class="card">
        
        <div class="card-content">
            <h3 class="card-title">Active Loans</h3>
            <p class="card-text">
                Active Loans
            </p>
        </div>
    </div>
    </a>

</div>
</body>
</html>