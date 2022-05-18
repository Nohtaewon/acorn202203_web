<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정할 할일의 번호와 내용을 읽어와서
	request.setCharacterEncoding("utf-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	//2. DB에 수정 반영하고
	TodoDto dto=new TodoDto(num, content, regdate);
	boolean isSuccess=TodoDao.getInstance().update(dto);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("수정 성공했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패했습니다.");
			location.href="updateform.jsp?num<%=dto.getNum()%>";
		</script>
	<%} %>
</body>
</html>