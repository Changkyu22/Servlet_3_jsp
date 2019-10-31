<%@page import="com.nuri.point.pointDTO"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.point.pointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	pointDTO pointDTO = new pointDTO();
	pointDTO.setNum(Integer.parseInt(request.getParameter("num")));
	
	pointDAO pointDAO = new pointDAO();
	Connection con = DBConnector.getConnection();
	int result = pointDAO.delete(con, pointDTO);	
	
	con.close();
	
	String message = "실패";

	if(result>0){
		message="성공";
	}
	
	// 성공하면 성공메세지 띄우고 list
	// 실패하면 list로 바로이동
	
	if(result>0){
		request.setAttribute("msg", message);
		request.setAttribute("path", "./pointList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		response.sendRedirect("./pointList.jsp");
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