<%@page import="com.nuri.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
	
<%
	if(memberDTO == null || memberDTO.getGrade() != 3){
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}

	
%>
	<div class="container">
	  <h2>Notice Insert Page</h2>
	  <form action="./noticeWriteResult.jsp" method="post" id="frm" onsubmit=true>
	  
	    <div class="form-group">
	      <label for="name">TITLE</label>
	      <input type="text" class="form-control" id="title" placeholder="Enter TITLE" name="title">
	    </div>
	    
	    <div class="form-group">
	      <label for="writer">WRITER</label>
	      <input type="text" class="form-control" id="writer" placeholder="Enter your ID or name" name="writer" value="<%= memberDTO.getId() %>" readonly="readonly">
	    </div>
	    
	    <div class="form-group">
      		<label for="comment">Contents:</label>
      		<textarea class="form-control" rows="5" id="contents" placeholder="Enter contents" name="contents"></textarea>
   		</div>
	    
	    
	    <button class="btn btn-default" id="submit">SUBMIT</button>
		<a href="./noticeList.jsp" class="btn btn-default">LIST</a>
	  </form>
	</div>
	
	<script type="text/javascript">
		var title = document.getElementById("title");
		var writer = document.getElementById("writer");
		var contents = document.getElementById("contents");
		var submit = document.getElementById("submit");
		
		$('#submit').click(function() {
			if($("#title").prop("value") == "" || $("#writer").prop("value") == "" || $("#contents").prop("value") == ""){
				alert("내용을 입력하세요");
				return false;
			}else{
				$("#frm").submit()
			}
		});
			
		
	</script>
</body>
</html>