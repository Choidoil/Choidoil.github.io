<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원출력</title>
<%
	String id ="guest";
	try{
		id = (String)session.getAttribute("id");
	}catch (Exception e){
		id = null;
	}
	if (!id.equals("admin")){
		%>
			<script type="text/javascript">
				alert('admin(관리자)만 접속이 가능합니다.');
				history(-1);
			</script>
		<%		
		response.sendRedirect("/dessert/");
	}
%>	

</head>
<body>
	<h1 align="center">회원명단출력</h1><hr>
	<table width="800" border="1" align="center">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>연령대</th>
			<th>직업</th>
			<th>취미</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.id }</td>
				<td>${dto.pass }</td>
				<td>${dto.email }</td>
				<td>${dto.tel }</td>
				<td>${dto.age }</td>
				<td>${dto.job }</td>
				<td>${dto.hobby }</td>
				<td align="center">
				<button onclick="location.href='delete?id=${dto.id}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<menu align="center">
	<a href="/dessert/member/writeForm">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="/dessert/">HOME</a>&nbsp;&nbsp;&nbsp;
	<a href="/dessert/member/batchForm">회원가입배치(batch)작업</a>
	</menu>
</body>
</html>