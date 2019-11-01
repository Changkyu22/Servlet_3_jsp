<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.member.memberDAO"%>
<%@page import="com.nuri.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="../layout/nav.jsp" %>
	<div class="container">
		<h2>Update Form</h2>
		<form action="./memberUpdateResult.jsp" id="frm" onsubmit=true method="post">
		    <div class="form-group">
				<label for="id">ID:</label>
				<input type="text" class="form-control" id="id" placeholder="Enter ID" required="required" name="id" value="<%= memberDTO.getId() %>" readonly="readonly">
		    </div>
		    <div class="form-group">
				<label for="pw">PW:</label>
				<input type="password" class="form-control" id="pw" placeholder="Enter PW" required="required" name="pw" value="=<%=memberDTO.getPw() %>">
		    </div>
		    <div class="form-group">
				<label for="name">NAME:</label>
				<input type="text" class="form-control" id="name" placeholder="Enter NAME" required="required" name="name" value="<%= memberDTO.getName()%>">
		    </div>
		    <div class="form-group">
				<label for="email">email:</label>
				<input type="email" class="form-control" id="email" placeholder="Enter E-MAIL" required="required" name="email" value="<%= memberDTO.getEmail() %>">
		    </div>
		    <div class="form-group">
				<label for="phone">PHONE:</label>
				<input type="tel" class="form-control" id="phone" placeholder="Enter PHONE NUMBER" required="required" name="phone" value="<%=memberDTO.getPhone() %>">
		    </div>
			<button type="submit" class="btn btn-default">Update Complete</button>
		</form>
	</div>
</body>
</html>