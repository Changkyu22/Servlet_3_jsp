<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.point.pointDAO"%>
<%@page import="com.nuri.point.pointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	pointDTO pointDTO = new pointDTO();

	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setTotal(pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getTotal() / 3.0);

	pointDAO pointDAO = new pointDAO();
	Connection con = DBConnector.getConnection();
	int result = pointDAO.insert(con, pointDTO);



	/* <------------------------------------------------ DELETE ----------------------------------------------> */

	// 	pointDTO.setNum(Integer.parseInt(request.getParameter("num")));

	// 	int result2 = pointDAO.delete(con, pointDTO);

	// 	con.close();

		String message = "실패";

		if(result>0){
			message="성공";
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		location.href="../common/common_result.jsp?message=<%= message %>";
	</script>
	
	<a href="../common/common_result.jsp?message=<%= message %>">result</a>
	
	
	
	
	
</body>
</html>