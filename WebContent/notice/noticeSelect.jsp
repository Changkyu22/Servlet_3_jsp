<%@page import="com.nuri.notice.noticeDTO"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	noticeDAO noticeDAO = new noticeDAO();
	Connection con = DBConnector.getConnection();
	noticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
	
	String message = "실패";

	if(noticeDTO != null){
		message="성공";
	}
	
// 	if(noticeDTO == null){
// 		request.setAttribute("dto", noticeDTO);
// 		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		
// 		view.forward(request, response);
// 	}else{
// 		response.sendRedirect("./noticeSelectResult.jsp");
// 	}
	
	if(noticeDTO == null){
		request.setAttribute("msg", message);
		request.setAttribute("path", "./noticeList.jsp");
		RequestDispatcher view2 = request.getRequestDispatcher("../common/common_result.jsp");
		
		view2.forward(request, response);
		
// 		response.sendRedirect("./noticeList.jsp");
	}else{
		request.setAttribute("dto", noticeDTO);
		RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
		
		view.forward(request, response);
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