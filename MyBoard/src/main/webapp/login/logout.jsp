<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃처리</title>
</head>
<body>
<script>
	alert('로그아웃 됩니다.');
</script>
<%

	session.removeAttribute("login.id");
	//session.removeAttribute("login.name");
	//session.removeAttribute("login.pw");
	//session.removeAttribute("login.loginOk");
	String root = (String)session.getAttribute("root");
	response.sendRedirect("../");
%>

</body>
</html>