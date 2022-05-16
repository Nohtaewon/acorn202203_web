<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1, "김구라", "노량진"));
	list.add(new MemberDto(2, "해골", "행신동"));
	list.add(new MemberDto(3, "원숭이", "상도동"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
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
            <h3>회원 목록입니다.</h3>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<% for(MemberDto tmp:list){%>
							<tr>
								<td><%=tmp.getNum() %></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getAddr() %></td>
							</tr>
						<%} %>
					</tbody>
				</table>
            </main>
        </div>
</body>
</html>