<%@page import="test.food.dao.FoodDao"%>
<%@page import="test.food.dto.FoodDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 수정할 회원의 번호는???
   int num=Integer.parseInt(request.getParameter("num"));
   // 수정할 회원의 정보를 DB 에서 읽어와서
   FoodDto dto=FoodDao.getInstance().getData(num);
   // 응답하기 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="food" name="thisPage"/>
	</jsp:include>
   <div class="container">
   	<nav class="mt-2">
   		<ol class="breadcrumb">
   			<li class="breadcrumb-item">
   				<a href="${pageContext.request.contextPath }/index.jsp" class="link-danger">Home</a>
   			</li>
   			<li class="breadcrumb-item">
   				<a href="${pageContext.request.contextPath }/food/list.jsp" class="link-danger">음식목록</a>
   			</li>
   			<li class="breadcrumb-item">수정페이지</a>
   			</li>
   		</ol>
   	</nav>
      <h1>음식 정보 수정 양식</h1>
      <form action="update.jsp" method="post">
      	 <input type="hidden" name="num" value="<%=num%>" />
         <div class="mb-2">
            <label class="form-label" for="num">번호</label>
            <input class="form-control" type="text" id="num" value="<%=num%>" disabled/>
         </div>
         <div class="mb-2">
            <label class="form-label" for="name">이름</label>
            <input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>"/>
         </div>
         <div class="mb-2">
            <label class="form-label" for="addr">주소</label>
            <input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
         </div>
         <button class="btn btn-outline-primary btn-sm" type="submit">수정확인</button>
         <button class="btn btn-outline-danger btn-sm" type="reset">취소</button>
      </form>
   </div>
</body>
</html>










