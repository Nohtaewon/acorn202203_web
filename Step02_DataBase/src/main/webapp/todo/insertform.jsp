<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/inserform.jsp</title>
</head>
<body>
	<div class="container">
		<h2>할일 추가 양식</h2>
		<form action="insert.jsp" method="post">
			<div>
				<label for="content">할 일</label>
				<input type="text" name="content" id="content" />
			</div>
			<button type="submit">추가</button>
		</form>
	</div>

</body>
</html>