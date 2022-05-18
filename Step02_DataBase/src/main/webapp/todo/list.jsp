<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트에게 출력한 회원 목록 얻어오기
	List<TodoDto> list=TodoDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<!-- bootstrap css 로딩 인터넷에서 가져오는법-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
	.a1 {
	   float: right;
	}
</style>
<script type="text/javascript">
	function updateBtn(){
	    let radio = document.querySelector('[name=radio]:checked');
	    if(radio==null){
	       alert("수정할 컨텐츠를 체크 하세요!");
	       return;//함수를 여기서 끝내기 
	    }
	    location.href = "updateform.jsp?num="+radio.value;
	 }
	    //삭제 버튼을 눌렀을때 호출되는 함수 
	 function deleteBtn(){
	    let radio = document.querySelector('[name=radio]:checked');
	    if(radio==null){
	       alert("삭제할 컨텐츠를 체크 하세요!");
	       return;//함수를 여기서 끝내기 
	    }
	    if(confirm("정말로 삭제 합니까?")){
	      //delete.jsp 페이지로 이동하면서 num 이라는 파라미터 명으로 삭제할 번호를 들고 가도록 한다. 
	      location.href = "delete.jsp?num="+radio.value;
	    }
	 }
</script>
</head>
<body>
   <jsp:include page="/include/navbar.jsp">
   		<jsp:param value="todo" name="thisPage"/>
   </jsp:include>
   <div class="container">
      <a href="insertform.jsp" class="a1">
      	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-clipboard-plus mb-1 link-dark" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
		  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
		  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
		</svg>
      </a>
      <table class="table table-bordered table-hover">
         <thead class="table-light">
            <tr style="margin:auto; text-align:center;">
               <th width="100" align="center">번호</th>
               <th>할일</th>
               <th width="200">날짜</th>
               <th width="100">선택</th>
            </tr>
         </thead>
         <tbody>
            <%for (TodoDto tmp : list) {%>
            <tr>
               <td><%=tmp.getNum()%></td>
               <td><%=tmp.getContent()%></td>
               <td><%=tmp.getRegdate()%></td>
               <td><input type="radio" name="radio" value="<%=tmp.getNum()%>"/></td>
            </tr>
            <%}%>
         </tbody>
      </table>
   </div>
   <div class="container" align="right">
      <button onclick="updateBtn()">
      	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" fill="currentColor" class="bi bi-pen-fill link-dark" viewBox="0 0 16 16">
		  <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
		</svg>
      </button>
      <button onclick="deleteBtn()" >
      	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" fill="currentColor" class="bi bi-trash2-fill link-dark" viewBox="0 0 16 16">
		  <path d="M2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225zm9.89-.69C10.966 2.214 9.578 2 8 2c-1.58 0-2.968.215-3.926.534-.477.16-.795.327-.975.466.18.14.498.307.975.466C5.032 3.786 6.42 4 8 4s2.967-.215 3.926-.534c.477-.16.795-.327.975-.466-.18-.14-.498-.307-.975-.466z"/>
		</svg>
      </button>
   </div>
</body>
</html>