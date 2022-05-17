<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto dto=TodoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link rel="stylesheet" type="text/css" href="/Hello/css/bootstrap.css">
<script src="js/bootstrap.js"></script>
	<style>
        .bd-placeholeder-img{
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width:768px){
            .bd-placeholeder-img-lg{
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
	<body class="d-flex h-100 text-center text-white bg-dark">
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
          <header class="mb-auto">
            <div>
              <h3 class="float-md-start mb-0"></h3>
            </div>
          </header>
          <main class="px-3">
            <h1>수정양식</h1>
            <p class="lead">인덱스 페이지 입니다.</p>
            <p class="lead">
              	<form action="update.jsp" method="post">
				<input type="hidden" name="num" value=<%=num %> />	
				<div>
					<label for="num">번호</label>
					<input type="text" id="num" value=<%=num %> disabled/>
				</div>
				<div>
					<label for="content">할일</label>
					<input type="text" name="content" id="content" value=<%=dto.getContent() %>/>
				</div>
					<button type="submit">수정확인</button>
					<button type="reset">취소</button>
				</form>
            </p>
          </main>
        </div>


</body>
</html>