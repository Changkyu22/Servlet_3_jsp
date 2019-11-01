<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 // 1번째 방법 : 세선 지우기
 // session.removeAttribute("member");

 // 2번째 방법 : 세선에 null 값을 넣어 if조건문을 false 만들기
 // session.setAttribute("member", null);
 
 // 3번째 방법	: 세션에 일정시간을 부과하여 강제 종료 시키기
 	session.invalidate();
	response.sendRedirect("../index.jsp");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>