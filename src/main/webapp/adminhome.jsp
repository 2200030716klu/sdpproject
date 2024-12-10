<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="adminnavbar.jsp"%>

   <style>

body{
 height: 100%;
    margin: 0;
   background: url('img/call-bg.jpg'); /* Image path */
   background-size: auto;
    background-repeat: no-repeat;
   background-position:top;
   overflow: hidden; 
   
   }
   
   .container {
    position: absolute;
    bottom: 150px;
    width: 100%;
     justify-content: space-evenly;
    flex-wrap: wrap; 
    display: flex;
    justify-content: space-evenly;
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
    font-size: 1.5rem;
    margin: 0 0 10px;
    color: #333;
}

.card-text {
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

<h1 style="color: white; text-align: center; margin-top: 13%;">Welcome Admin</h1>


 <div class="container">
 <a href="viewallborrowers">
 <div class="card">

        <div class="card-content">
            <h3 class="card-title">Borrowers</h3>
            <p class="card-text">
                Borrowers
            </p>
        </div>
    </div>
    </a>
    
    <a href="viewalllenders" >
     <div class="card">
        
        <div class="card-content">
            <h3 class="card-title">Lenders</h3>
            <p class="card-text">
                Lenders
            </p>
        </div>
    </div>
    </a>

</div>
</body>
</html>