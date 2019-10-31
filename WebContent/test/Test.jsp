<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String n = request.getParameter("n");
	
	response.sendRedirect("./testForward.jsp?n=iu");

// 	RequestDispatcher view = request.getRequestDispatcher("./testForward.jsp");
// 	view.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Test</h1>
	<h1><%= n %></h1>
</body>
</html>