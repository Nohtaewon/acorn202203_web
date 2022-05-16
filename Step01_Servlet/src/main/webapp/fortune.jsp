<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	//오늘의 운세를 미리 배열에 준비하고 
	String[] fortunes= {
		"동쪽으로 가면 귀인을 만나요",
		"로또를 사면 5등이 될거에요",
		"먹을 복이 있어요",
		"어쩌구...",
		"저쩌구..."
	};
	Random ran=new Random();
	int ranNum=ran.nextInt(5);	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
</head>
<body>
	<p>오늘의 운세: <strong><%=fortunes[ranNum] %></strong></p>
</body>
</html>