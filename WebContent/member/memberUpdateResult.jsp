<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="com.nuri.member.memberDAO"%>
<%@page import="com.nuri.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	memberDAO memberDAO = new memberDAO();
	memberDTO memberDTO = new memberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	
	memberDTO sessionDTO = (memberDTO)session.getAttribute("member");
	memberDTO.setGrade(sessionDTO.getGrade());
	
	Connection con = DBConnector.getConnection();
	int result = memberDAO.memberUpdate(con, memberDTO);
	
	con.close();
	
	String message = "업데이트 실패";
	if(result >0){
		message="업데이트 성공";
	}
	
	if(result>0){
		request.setAttribute("msg", message);
		request.setAttribute("path", "../index.jsp");
		session.setAttribute("member", memberDTO);
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		request.setAttribute("msg", message);
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
<%-- 	<%@ include file="../layout/nav.jsp" %>	 --%>
</body>
</html>