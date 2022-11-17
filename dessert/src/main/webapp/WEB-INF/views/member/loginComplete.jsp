<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
	<%=id %>님 로그인 했군요. <br>
	로그인 처리 화면입니다. <br>
	<a href="/dessert/">메인으로</a>
</body>
</html>