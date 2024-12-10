
<%@page import="com.klef.jfsd.lms.model.Lender"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Lender l = (Lender)session.getAttribute("lender");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<%@include file="lendernavbar.jsp" %>
<br/>

<br/><br/><br/><br/>


	<div class="container" style="margin-top: 90px">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
				<h3 class="text-center" style="margin-top: 20px">Borrower Profile Update</h3>
					 
					
						
				<div class="card-body">
					<form th:action="@{/loan/{id} (id=${loan.id})}" th:object="${loan}"
						method="post" action="updatelp" enctype="multipart/form-data">
						
						
						 
					
					<div class="form-group">
							<label> ID </label>
							 <input type="number" name="lid" value=<%=l.getId()%>
								th:field="dob" class="form-control"  readonly="true"
								placeholder="ID" />
						</div>
						
						
						<div class="form-group">
							<label>  Name </label> <input type="text" name="lname" value="<%=l.getName()%>"
								th:field="*{firstName}" class="form-control" readonly="true"
								placeholder="Enter Name" />
						</div>
						
						
						<div class="form-group">
						<labeL> Select Gender </labeL>
						
						 <select name="lgender" class="form-control" placeholder="Select Gender">
						    <option value=<%=l.getGender()%>>Select</option>
						    <option value="Male">Male</option>
						    <option value="FeMale">Female</option>
						    <option value="Others">Others</option>
						  </select>
 						 </div>
 						 
 						 
 						 <div class="form-group">
							<label> Date-of-Birth </label> <input type="date" name="ldob" value=<%=l.getDateofbirth()%>   
								th:field="dob" class="form-control"
								placeholder="Enter Date-of-Birth" />
						</div>

						
						<div class="form-group">
							<label> Email </label> <input type="text" name="lemail" value=<%=l.getEmail()%>
								th:field="*{email}" class="form-control"
								placeholder="Enter Email" />
						</div>
						
						
						<div class="form-group">
							<label> Address </label> <input type="text" name="laddress" value=<%=l.getAddress()%>
								th:field="address" class="form-control"
								placeholder="Enter Address" />
						</div>
						
						
						<div class="form-group">
							<label> Contact </label> <input type="text" name="lcontact"  value=<%=l.getContact() %>
								th:field="*{term}" class="form-control" placeholder="Enter Contact no" />
						</div>
						
						<div class="form-group">
							<label> Image </label> <input type="file" name="limage"  value=<%=l.getImage() %>
								th:field="*{term}" class="form-control" placeholder="Upload Image" />
						</div>
						
						
						
						<div class="form-group">
							<label> Password </label> <input type="password" name="lpwd"  value=<%=l.getPassword()%> 
								th:field="*{term}" class="form-control" placeholder="Password" />
						</div>


						<div class="box-footer" align="center">
							<button  type="submit" class="btn btn-primary">
								Update</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>


</body>




</html>