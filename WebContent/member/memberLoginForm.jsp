<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie[] cookies = request.getCookies();
	String iu = "";
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
			iu  = cookies[i].getValue();
			break;
		}
	}
	
// 변형된 for문	
// 	for(Cookie cookie: cookies){	
// 			if(cookie.getName().equals("id")){
// 				iu = cookie.getValue();
// 				break;
// 			}
// 	}
%>
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
  		<h2>Member Login Form</h2>
		<form action="./memberloginResult.jsp" method="post">
		    <div class="form-group">
		    	<label for="id">ID:</label>
		      	<input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" value="<%= iu %>">
		    </div>
		    <div class="form-group">
		      	<label for="pwd">Password:</label>
		      	<input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
		    </div>
		    <div class="checkbox">
		      	<label><input type="checkbox" checked="checked" name="remember" value="check"> Remember me</label>
		    </div>
		    	<button type="submit" class="btn btn-default">Submit</button>
  		</form>
</div>
</body>
</html>