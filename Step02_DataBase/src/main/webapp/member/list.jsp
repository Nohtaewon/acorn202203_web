<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트에게 출력한 회원 목록 얻어오기
	List<MemberDto> list=MemberDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<!-- bootstrap css 로딩 인터넷에서 가져오는법-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
	<body class="d-flex h-100 text-center">
    
       <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
         <header class="mb-auto">
           <div>
             <h3 class="float-md-start mb-0"></h3>
           </div>
         </header>
       	 
       	 <main class="px-3">
            <h2>회원 목록</h2>
				<table class="table table-striped mt-2" >
					<thead class="table-dark">
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<% for(MemberDto tmp:list){%>
							<tr>
								<td><%=tmp.getNum() %></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getAddr() %></td>
								<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
								<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
							</tr>
						<%} %>
					</tbody>
				</table>
				<a href="insertform.jsp">회원추가</a>
            </main>
        </div>
</body>
</html>