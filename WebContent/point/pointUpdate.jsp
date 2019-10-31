<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.point.pointDTO"%>
<%@page import="com.nuri.point.pointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	pointDAO pointDAO = new pointDAO();
	Connection con = DBConnector.getConnection();
	
	
	int result = Integer.parseInt(request.getParameter("num"));
	pointDTO pointDTO = pointDAO.selectOne(con, result);
	
		
	con.close();
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
</head>
<body>
	<div class="container">
	  <h2>Point Update Page</h2>
	  <form action="./pointUpdateResult.jsp?num=<%= pointDTO.getNum() %>" method="post">
	  
	  	<input type="hidden" name="num" value="<%= pointDTO.getNum() %>">
	  	
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" value="<%= pointDTO.getName() %>" name="name">
	    </div>
	    
	    <div class="form-group">
	      <label for="kor">Kor:</label>
	      <input type="text" class="form-control" id="kor" value="<%= pointDTO.getKor() %>" name="kor">
	    </div>
	    
	    <div class="form-group">
	      <label for="eng">Eng:</label>
	      <input type="text" class="form-control" id="eng" value="<%= pointDTO.getEng() %>" name="eng">
	    </div>
	    
	    <div class="form-group">
	      <label for="math">Math:</label>
	      <input type="text" class="form-control" id="math" value="<%= pointDTO.getMath() %>" name="math">
	    </div>
	    
	    <button type="submit" class="btn btn-default">Update</button>
		<a href="./pointList.jsp">List</a>
	  </form>
	</div>
</body>
</html>