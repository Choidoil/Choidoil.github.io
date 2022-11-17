<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="/dessert/resources/style.css" rel="stylesheet"/>


<title>Home</title>
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
	<a class=top1 href="member/loginForm" title="로그인">로그인</a>&nbsp;
	<a class=top1 href='/dessert/member/writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	
	<div class="homeTop2">
	<a href=""><img class = "topImage" src="resources/dessertLogo6.png" alt="logo"></a>
	</div>
	
<nav class="navbar" height="200px" >
<ul class="navbar_menu" >
	
	<li><a class="navbar_font" href="#">강사진소개</a></li>
	<li><a class="navbar_font" href="reserve/reserveMain">수강신청</a></li>
	<li><a class="navbar_font" href="board/list">커뮤니티게시판</a></li>
	<li><a class="navbar_font" href="board/list2">공지사항</a></li>
	</ul></nav>
	
	<%
		} else {
	%>
	
	
	<%
		if (xid.equals("admin")) {
	%>
	<div class="homeTop">
	<a class=top1><%=xid%>님 환영합니다.&nbsp;&nbsp;&nbsp; </a>
	<a class=top1 href="member/logout" title="로그아웃">로그아웃</a>&nbsp;
	<a class=top1 href='/dessert/member/writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	
	<div class="homeTop2">
	<a href=""><img class = "topImage" src="resources/dessertLogo6.png" alt="logo"></a>
	</div>	
	
	<nav class="navbar"  ><ul class="navbar_menu" >
	<li><a class="navbar_font" href="member/list">회원관리</a></li>
	<li><a class="navbar_font" href="car/list">강의목록관리</a></li>
	<li><a class="navbar_font" href="/dessert/reserve/allReserveList">총신청목록</a></li>
	</ul></nav>
	<%
		} else {
	%>
	
	
	<div class="homeTop">
	<a class=top1><%=xid%>님 환영합니다.&nbsp;&nbsp;&nbsp; </a>
	<a class=top1 href="member/logout" title="로그아웃">로그아웃</a>&nbsp;
	<a class=top1 href='/dessert/member/writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	<div class="homeTop2">
	<a href=""><img class = "topImage" src="resources/dessertLogo6.png" alt="logo"></a>
	</div>	
	

<nav class="navbar"  >
<ul class="navbar_menu" >
	
	<li><a class="navbar_font" href="#">강사진소개</a></li>
	<li><a class="navbar_font" href="reserve/reserveMain">수강신청</a></li>
	<li><a class="navbar_font" href="reserve/reserveList">수강신청확인</a></li>
	<li><a class="navbar_font" href="board/list">커뮤니티게시판</a></li>
	<li><a class="navbar_font" href="board/list2">공지사항</a></li>
	</ul></nav>


	
	
<%
		}
	%>

	<%
		}
	%>
<div class="service_img" ></div>
<div class=home_1>
 	 <a class=addview href="reserve/reserveMain">모집중인 강의 더보기+ &nbsp</a>
</div>
<div class=home_2>
 			
  			<div >
  			  
  			 <div ><img class = "home_2_1" src="resources/수학1.png" alt="logo" style="margin-left:'1px;'"></div>
  			 <div ><img class = "home_2_1" src="resources/국어3.png" alt="logo"></div>
  			 <div ><img class = "home_2_1" src="resources/수학2.png" alt="logo"></div>
  			 <div ><img class = "home_2_1" src="resources/영어1.png" alt="logo"></div>
  			 <div ><img class = "home_2_1" src="resources/영어2.png" alt="logo"></div>
  			
  			
  			</div>


	<div class="service" >
 	<div class="service_0" style="margin: '5px 0px 0px 0px;'">
 	
 	</div>

  <!--  <div class="service_L">
      		 <div ><img class = "topImage" src="resources/좌측배너2.jpg" alt="logo"></div>
      		 <div ><img class = "topImage" src="resources/좌측배너3.jpg" alt="logo"></div>
    		 <div ><img class = "topImage" src="resources/좌측배너1.jpg" alt="logo"></div>
  			
  	</div> -->


<div >  	</div>

	


</body>
</html>
