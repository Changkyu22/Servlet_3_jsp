<%@page import="com.nuri.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
// 	memberDTO memberDTO = (memberDTO)session.getAttribute("member");

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
	<%@ include file="../layout/nav.jsp" %>
	
<%-- 	<%= if(memberDTO == null) {%> --%>
		
<%-- 	<%} %> --%>
	
<div class="container">
	<h2>My Page Form</h2>
	<form action="./memberUpdateForm.jsp" id="frm" onsubmit=true method="post">
	    <div class="form-group">
			<label for="id">ID:</label>
			<input type="text" class="form-control" id="id" placeholder="Enter ID" required="required" name="id" value="<%= memberDTO.getId() %>" readonly="readonly">
	    </div>
	    <div class="form-group">
			<label for="pw">PW:</label>
			<input type="password" class="form-control" id="pw" placeholder="Enter PW" required="required" name="pw" value="=<%=memberDTO.getPw() %>" readonly="readonly">
	    </div>
	    <div class="form-group">
			<label for="name">NAME:</label>
			<input type="text" class="form-control" id="name" placeholder="Enter NAME" required="required" name="name" value="<%= memberDTO.getName()%>" readonly="readonly">
	    </div>
	    <div class="form-group">
			<label for="email">email:</label>
			<input type="email" class="form-control" id="email" placeholder="Enter E-MAIL" required="required" name="email" value="<%= memberDTO.getEmail() %>" readonly="readonly">
	    </div>
	    <div class="form-group">
			<label for="phone">PHONE:</label>
			<input type="tel" class="form-control" id="phone" placeholder="Enter PHONE NUMBER" required="required" name="phone" value="<%=memberDTO.getPhone() %>" readonly="readonly">
	    </div>
	     <div class="form-group">
			<label for="phone">Grade:</label>
			<input type="tel" class="form-control" id="phone" placeholder="Enter PHONE NUMBER" required="required" name="phone" value="<%=memberDTO.getGrade() %>" readonly="readonly">
	    </div>
		<button type="submit" class="btn btn-default">GO Update</button> 
		<a href="./memberDeleteResult.jsp?id=<%= memberDTO.getId() %>" class="btn btn-default">QUIT</a>
	</form>
</div>

</body>
</html>