<%@page import="com.nuri.point.pointDTO"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.point.pointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	pointDAO pointDAO = new pointDAO();
	pointDTO pointDTO = new pointDTO();
	Connection con = DBConnector.getConnection();
	pointDTO = pointDAO.selectOne(con, num);

	if(pointDTO == null){
		response.sendRedirect("./pointList.jsp");
	}else{
		
		request.setAttribute("dto", pointDTO);
		RequestDispatcher view = request.getRequestDispatcher("./pointSelectResult.jsp");
		view.forward(request, response);
	}
%>
	
