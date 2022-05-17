<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨지지 않도록 설정
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 이름과 주소를 읽어온다.
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//2. DB에 저장한다.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao=MemberDao.getInstance();
	//저장하고 성공여부를 리턴 받는다.
	boolean isSuccess=dao.insert(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=name %></strong> 님의 정보를 추가 했습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				회원 추가 실패!
				<a href="insertform.jsp">다시 시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>