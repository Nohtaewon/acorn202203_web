<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 수정할 회원의 번호는???
   int num=Integer.parseInt(request.getParameter("num"));
   // 수정할 회원의 정보를 DB 에서 읽어와서
   MemberDto dto=MemberDao.getInstance().getData(num);
   // 응답하기 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
</head>
<body>
   <div class="container">
      <h1>회원 정보 수정 양식</h1>
      <form action="update.jsp" method="post">
      	 <%-- jsp 페이지가 무시하는 주석 --%>
      	 <%--
      	 	disabled 속성을 가지고 있는 input 요소는 폼을 제출했을 때 수정도 되지 않는다.
      	 	따라서 수정할 회원의 번호를 숨긴 input 요소에 넣어서 폼이 제출될 때
      	 	같이 전송되도록 해야 한다.
      	  --%>
      	 <input type="hidden" name="num" value="<%=num%>" />
         <div>
            <label for="num">번호</label>
            <input type="text" id="num" value="<%=num%>" disabled/>
         </div>
         <div>
            <label for="name">이름</label>
            <input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
         </div>
         <div>
            <label for="addr">주소</label>
            <input type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
         </div>
         <button type="submit">수정확인</button>
         <button type="reset">취소</button>
      </form>
   </div>
</body>
</html>










