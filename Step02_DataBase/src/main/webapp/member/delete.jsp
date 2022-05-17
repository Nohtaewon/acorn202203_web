<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 회원의 번호를 읽어온다.	
	int num=Integer.parseInt(request.getParameter("num"));
	//회원 한명의 정보를 삭제하고 
	boolean isSuccess=MemberDao.getInstance().delete(num);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			//알림창 띄우고
			alert("삭제 했습니다.");
			//javascript 를 이용해서 페이지 이동
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("삭제 실패!");
			location.href="list.jsp";
		</script>
	<%} %>
</body>
</html>