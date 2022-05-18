<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 할일 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 할 일의 정보를 얻어와서
	TodoDto dto=TodoDao.getInstance().getData(num);
	//3. 할 일 수정 폼 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
            <p class="lead">
            	<img src="../images/kim1.png">
              	<form action="update.jsp" method="post">
				<input type="hidden" name="num" value=<%=num %> />	
				<div>
					<label for="num">번호</label>
					<input type="text" id="num" value=<%=num %> disabled />
				</div>
				<div>
					<label for="content">할일</label>
					<input type="text" name="content" id="content" value=<%=dto.getContent()%> />
				</div>
					<button type="submit">수정확인</button>
					<button type="reset">취소</button>
				</form>
            </p>
          </main>
        </div>


</body>
</html>