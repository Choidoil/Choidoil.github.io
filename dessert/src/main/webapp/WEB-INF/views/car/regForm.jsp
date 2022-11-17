<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>강의등록폼</title>
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
	<a href="../"><img class = "topImage" src="../resources/dessertLogo6.png" alt="logo"></a>
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
	
<div class="service">
 	<div class="service_0">
 	
 	</div>

        <div class="service_L">
     	
		<h3><a>등록강의목록</a></h3><hr>
		
 	 </div>

	<div class=service_C >

	<p></p>
	<p></p>	
	<p></p>
	<p></p>	
	
<div align="center"><h1>강의등록</h1></div>

<form action="registCar" method="post">
	<table width="700" align="center" border="1">
		<tr>
			<th>강의명</th>
			<td colspan="2"><input type="text" name="name" size="50"></td>
		</tr>
		
		<tr>
			<th>카테고리</th>
			<td><input type="text" name="category" size="50"></td>
			<td>1.언어 2.수학 3.영어</td>
		</tr>
		
		<tr>
			<th>수강료</th>
			<td colspan="2"><input type="text" name="price" size="50"></td>
		</tr>
		
		
			
			<input type="hidden" name="usepeople" value="1">
		
		
		
			
			<input type="hidden" name="company" value="1">
		
				
		<tr>
			<th>이미지 이름</th>
			<td colspan="2"><input type="text" name="img" size="50"></td>
		</tr>
		<tr>
			<th>상세정보</th>
			<td colspan="2"><input type="text" name="info" size="50"></td>
		</tr>

		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="list">강의목록</a>
			</td>
		</tr>
		
	</table>
</form>

</div>
<div class="service_R">
	
  			 <div ><img class = "topImage" src="../resources/좌측배너2.jpg" alt="logo"></div>
     		 <div ><img class = "topImage" src="../resources/좌측배너3.jpg" alt="logo"></div>
    		 <div ><img class = "topImage" src="../resources/좌측배너1.jpg" alt="logo"></div>
  		
   </div>
	
	<div class="service_0">
	
 	</div>
</div>


</body>
</html>

