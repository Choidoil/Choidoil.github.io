<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="/dessert/resources/style.css" rel="stylesheet"/>

<title>예약정보</title>
</head>
<body>


		<%!String xid = null;%>

	<%
		try {
		xid = (String) session.getAttribute("id");
	} catch (Exception e) {
		xid = null;
	}
	if (xid == null) {
	%>
	<div class="homeTop" >
	<a class=top1>로그인이필요합니다.&nbsp;&nbsp;&nbsp;</a>
	<a class=top1 href="../member/loginForm" title="로그인">로그인</a>&nbsp;
	<a class=top1 href='../member/writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	
	<div class="homeTop2">
	<a href="../"><img class = "topImage" src="../resources/dessertLogo6.png" alt="logo"></a>
	</div>
	
<nav class="navbar" height="200px" >
<ul class="navbar_menu" >
	
	<li><a class="navbar_font" href="../">강사진소개</a></li>
	<li><a class="navbar_font" href="../reserve/reserveMain">수강신청</a></li>
	<li><a class="navbar_font" href="../board/list">커뮤니티게시판</a></li>
	<li><a class="navbar_font" href="../board/list">공지사항</a></li>
	</ul></nav>
	
	<%
		} else {
	%>
	
	
	<%
		if (xid.equals("admin")) {
	%>
	
	<div class="homeTop">
	<a class=top1><%=xid%>님 환영합니다.&nbsp;&nbsp;&nbsp; </a>
	<a class=top1 href="loginForm" title="로그인">로그인</a>&nbsp;
	<a class=top1 href='writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	
	<div class="homeTop2">
	<a href="../"><img class = "topImage" src="resources/dessertLogo6.png" alt="logo"></a>
	</div>	
	
	<nav class="navbar" height="200px" > <ul class="navbar_menu" >	
	<li><a class="navbar_font" href="../member/list">회원관리</a></li>
	<li><a class="navbar_font" href="../car/list">강의목록관리</a></li>
	<li><a class="navbar_font" href="../reserve/allReserveList">총신청목록</a></li>
		</ul></nav>
	
	<%
		} else {
	%>
	<div class="homeTop">
	<a class=top1><%=xid%>님 환영합니다.&nbsp;&nbsp;&nbsp; </a>
	<a class=top1 href="../member/logout" title="로그아웃">로그아웃</a>&nbsp;
	<a class=top1 href='../member/writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	<div class="homeTop2">
	<a href="../"><img class = "topImage" src="../resources/dessertLogo6.png" alt="logo"></a>
	</div>	
	

<nav class="navbar" height="200px" >
<ul class="navbar_menu" >
	
	<li><a class="navbar_font" href="../">강사진소개</a></li>
	<li><a class="navbar_font" href="../reserve/reserveMain">수강신청</a></li>
	<li><a class="navbar_font" href="../reserve/reserveList">수강신청확인</a></li>
	<li><a class="navbar_font" href="../board/list">커뮤니티게시판</a></li>
	<li><a class="navbar_font" href="../board/list">공지사항</a></li>
	</ul></nav>


	

<%
		}
	%>

	<%
		}
	%>
	
</br>
<center>
<form action="">
<table width="50%" border="1">

<tr height="50">
<td align="center" colspan="3"><font size="6" color="gray">예약된 정보를 출력하는 화면입니다. </font></td>
</tr>

<tr height="50">
<td align="center" colspan="3"><font size="6" color="gray"><image alt=""src="../resources/${img}" width="450"></image></td>
</tr> 

<tr height="50"> 
<td align="center" colspan="3"><font size="6" color="gray">강의명: ${reserveVo.name}</font></td>
</tr>

<tr height="50"> 
<td align="center" colspan="3"><font size="6" color="gray">과목: ${reserveVo.category}</font></td>
</tr>

<tr height="50"> 
<td align="center" colspan="3"><font size="6" color="gray">수강료: ${reserveVo.price}</font></td>
</tr>

<tr height="50"> 
<td align="center" colspan="3"><font size="6" color="gray">상세설명: ${reserveVo.info}</font></td>
</tr>

</table>
</form>	
</center>
</br>
<center>
<button onclick="location.href='/dessert/reserve/delete?regno=${currval}'">예약취소</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/dessert/'">확인</button>
</center>
</body>
</html>