<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<style>
        .navbar-brand:hover{
        	transform: rotate(-10deg) scale(2);
        }
        .navbar-brand{
        	tranform: transform 0.2s ease-out;
        }
        .carousel-inner > .carousel-item > img{
        	width: 300px;
        	height: 400px;
        }
    </style>
</head>
<body>
		<%--
			포함 시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다
			/ 는 바로 webapp 폴더가 된다.
			이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로 클라이언트에게 응답을 하게 된다.
		 
		 	포함시킬 페이지에 파라미터를 전달할 수 있다.
		 	
		 	thisPage 라는 파라미터명으로 index 라는 문자열을 전달하는 방법은 아래와 같다.
		 	
		 	<jsp:param value="index" name="thisPage" />
		 
		 	
		 --%>
		<jsp:include page="/include/navbar.jsp">
			<jsp:param value="index" name="thisPage" />
		</jsp:include>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="./images/kim1.png" class="d-block w-100 img-thumbnail">
		    </div>
		    <div class="carousel-item">
		      <img src="./images/kim2.png" class="d-block w-100 img-thumbnail">
		    </div>
		    <div class="carousel-item">
		      <img src="./images/kim1.png" class="d-block w-100 img-thumbnail">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
 
</body>
</html>