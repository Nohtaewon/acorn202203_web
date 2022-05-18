<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<h1>회원 추가 양식</h1>
	<form action="insert.jsp" method="post">
		<div class="mb-2">
			<label class="form-label" for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" />
		</div>
		<div class="mb-2">
			<label class="form-label" for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" />
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
	</form>
</div> 
</body>
</html>