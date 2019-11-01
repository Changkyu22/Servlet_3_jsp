<%@page import="com.nuri.member.memberDTO"%>
<%@page import="com.nuri.point.pointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.notice.noticeDAO"%>
<%@page import="com.nuri.notice.noticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	noticeDAO noticeDAO = new noticeDAO();
	Connection con = DBConnector.getConnection();
	
	ArrayList<noticeDTO> ar = noticeDAO.noticeList(con);
	
	memberDTO memberDTO = (memberDTO)session.getAttribute("member");

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
	<nav class="navbar navbar-inverse">
	 		<div class="container-fluid">
	    	<div class="navbar-header">
	      	<a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    <ul class="nav navbar-nav">
	    	<li class="active"><a href="/Servlet_3_jsp/index.jsp">Home</a></li>
	    	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
	        	<ul class="dropdown-menu">
	        		<li><a href="#">Page 1-1</a></li>
	        		<li><a href="#">Page 1-2</a></li>
	        		<li><a href="#">Page 1-3</a></li>
	        	</ul>
	      	</li>
	      	<li><a href="./notice/noticeList.jsp">NOTICE</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    	<% if(memberDTO != null) {%>
	    	<li><a href="<%= request.getContextPath() %>/member/memberMyPage.jsp"><span class="glyphicon glyphicon-user"></span>My Page</a></li>
	      	<li><a href="<%= request.getContextPath() %>/member/memberLogout.jsp"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
	      	<%}else{ %>
	      	<li><a href="<%= request.getContextPath() %>/member/memberJoinForm.jsp"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
	      	<li><a href="<%= request.getContextPath() %>/member/memberLoginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	    <%} %>
	    </ul>
	  	</div>
	</nav>

	<div class="container">
  		<div class="jumbotron">
    		<h1>Notice List Page</h1>
		</div>
	</div>
	<div class="container">
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>NUM</th><th>TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<%
	    		for(int i=0; i<ar.size(); i++){
	    			noticeDTO noticeDTO = ar.get(i);
	    	%>
	      <tr>
	        <td><%= noticeDTO.getNum() %></td>
	        <td><a href="./noticeSelect.jsp?num=<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></a></td>
	        <td><%= noticeDTO.getWriter() %></td>
	        <td><%= noticeDTO.getReg_date() %></td>
	        <td><%= noticeDTO.getHit() %></td>
	      </tr>
	    	<% } %>
	    </tbody>
	  </table>
	  <%if(memberDTO != null && memberDTO.getGrade() == 3){ %>
	  	<a href="./noticeWrite.jsp" class= "btn btn-default">Write</a>
	  <%} %>
	</div>
</body>
</html>