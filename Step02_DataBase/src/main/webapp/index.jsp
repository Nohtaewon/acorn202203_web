<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
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
            <h1>노태원</h1>
            <p class="lead">인덱스 페이지 입니다.</p>
            <p class="lead">
              <img src="./images/kim1.png">
              <a href="member/list.jsp" class="btn btn-lg btn-secondary fw-bold border-white bg-black">회원목록보기</a>
              <img src="./images/kim1.png">
            </p>
          </main>
        </div>
</body>
</html>