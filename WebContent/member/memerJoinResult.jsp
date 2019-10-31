<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.member.memberDAO"%>
<%@page import="com.nuri.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	memberDTO memberDTO = new memberDTO();
	memberDAO memberDAO = new memberDAO();
	
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
// 	memberDTO.setGrade(Integer.parseInt(request.getParameter("grade")));
	
	Connection con = DBConnector.getConnection();
	int result = memberDAO.memberJoin(con, memberDTO);
	
	String message = "회원가입 실패";
	int n = 0;
	
	if(result == 1){
		message="회원가입 성공";
	}
	
	if(result>0){
		request.setAttribute("msg", message);
		request.setAttribute("path", "../index.jsp");
		
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

</body>
</html>