<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">

   body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: left;
        }
        label {
             display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            color: red;
            margin-bottom: 15px;
        }

        a {
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
        
</style>
<%@include file="navbar.jsp"%>
</head>
<body>
 <!-- Display message if available -->
    <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
    %>
    <p class="message"><%=message%></p>
    <%
    }
    %>
   

    <form action="checklenderlogin" method="post">
    <h2 align="center"> Lender Login</h2>
    <hr>
    <br/>
        <label for="username">Username:</label>
        <input type="text" id="username" name="lemail" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="lpwd" required> 
        
        <input type="submit" value="Login">
    </form>
    
    <a href="lenderregistration">New user? register here</a>

</body>
</html>