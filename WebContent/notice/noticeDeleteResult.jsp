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
	noticeDTO noticeDTO = new noticeDTO();
	
	noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
	Connection con = DBConnector.getConnection();
	
	int result = noticeDAO.delete(con, noticeDTO.getNum());
	
	con.close();
	
	String message = "실패";

	if(result>0){
		message="성공";
	}
	
	if(result>0){
		request.setAttribute("msg", message);
		request.setAttribute("path", "./noticeList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		request.setAttribute("msg", message);
		
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