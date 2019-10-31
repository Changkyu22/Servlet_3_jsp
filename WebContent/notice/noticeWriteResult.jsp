<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.notice.noticeDTO"%>
<%@page import="com.nuri.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	noticeDTO noticeDTO = new noticeDTO();
	
	
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	noticeDAO noticeDAO = new noticeDAO();
	Connection con = DBConnector.getConnection();
	int result = noticeDAO.noticeInsert(con, noticeDTO);
	
	String message = "실패";

	if(result>0){
		message="성공";
	}
	
	request.setAttribute("msg", message);
	request.setAttribute("path", "./noticeList.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<script type="text/javascript"> -->
<%-- 		location.href="../common/common_result.jsp?message=<%= message%>"; --%>
<!-- 	</script> -->
	
<%-- 	<a href="../common/common_result.jsp>message<%= message %>" class="btn btn-default">RESULT</a> --%>
</body>
</html>