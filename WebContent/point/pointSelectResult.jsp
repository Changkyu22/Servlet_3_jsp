<%@page import="com.nuri.point.pointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	pointDTO pointDTO = (pointDTO)request.getAttribute("dto");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<h1>Point Select Page</h1>
	<div class="container">
		<table class="table">
			<thead>
				<tr><th>NUM</th><th>NAME</th><th>KOR</th><th>ENG</th><th>MATH</th><th>TOTAL</th><th>AVG</th></tr>
			</thead>
			<tbody>
				<tr>
					<td><%= pointDTO.getNum() %></td>
					<td><%= pointDTO.getName() %></td>
					<td><%= pointDTO.getKor() %></td>
					<td><%= pointDTO.getEng() %></td>
					<td><%= pointDTO.getMath() %></td>
					<td><%= pointDTO.getTotal() %></td>
					<td><%= pointDTO.getAvg() %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<a class="btn btn-danger" href="./pointUpdate.jsp?num=<%= pointDTO.getNum() %>">Update</a>
		<a href="./pointDeleteResult.jsp?num=<%= pointDTO.getNum() %>" class="btn btn-primary">Delete</a>
		
	</div>
	
</body>
</html>