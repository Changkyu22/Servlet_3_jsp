<%@page import="com.nuri.member.memberDTO"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	memberDTO memberDTO = (memberDTO)session.getAttribute("member");
	memberDAO memberDAO = new memberDAO();
	
// 	int result = Integer.parseInt(request.getParameter("id"));
	
	Connection con = DBConnector.getConnection();
	int result = memberDAO.memberDelete(con, memberDTO);
	
	con.close();
	
	session.invalidate();
	
	String message = "회원탈퇴 실패";
	
// 	if(result > 0){
// 		message = "회원탈퇴 성공";
// 	}
	
	if(result > 0){
		request.setAttribute("msg", "회원탈퇴 성공");
		request.setAttribute("path", "../index.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		request.setAttribute("msg", "회원탈퇴 실패");
		request.setAttribute("path", "../index.jsp");
		
		RequestDispatcher view2 = request.getRequestDispatcher("../common/common_result.jsp");
		view2.forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%@ include file="../layout/nav.jsp" %> --%>

</body>
</html>