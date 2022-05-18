<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 할 일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	//2. DB에 저장하고
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("할 일이 추가되었습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("실패");
			location.href="insertform.jsp";
		</script>
	<%} %>
</body>
</html>