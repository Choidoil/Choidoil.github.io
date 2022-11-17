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


<title>로그인</title>
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
	<a class=top1 href="loginForm" title="로그인">로그인</a>&nbsp;
	<a class=top1 href='writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
	</div>
	
	<div class="homeTop2">
	<a href="../"><img class = "topImage" src="../resources/dessertLogo6.png" alt="logo"></a>
	</div>
	
<nav class="navbar" height="200px" >
<ul class="navbar_menu" >
	
	<li><a class="navbar_font" href="../">강사진소개</a></li>
	<li><a class="navbar_font" href="../reserve/reserveMain">수강신청</a></li>
	<li><a class="navbar_font" href="../board/list">커뮤니티게시판</a></li>
	<li><a class="navbar_font" href="../board/list2">공지사항</a></li>
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
	<li><a class="navbar_font" href="list">회원관리</a></li>
	<li><a class="navbar_font" href="../car/list">강의목록관리</a></li>
	<li><a class="navbar_font" href="../reserve/allReserveList">총신청목록</a></li>
		</ul></nav>
	
	<%
		} else {
	%>
	<div class="homeTop">
	<a class=top1><%=xid%>님 환영합니다.&nbsp;&nbsp;&nbsp; </a>
	<a class=top1 href="logout" title="로그아웃">로그아웃</a>&nbsp;
	<a class=top1 href='writeForm' title="회원가입">회원가입</a>&nbsp;&nbsp;
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
	<li><a class="navbar_font" href="../board/list2">공지사항</a></li>
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
     	
		<h3><a>로그인</a></h3><hr>
		
 	 </div>

	<div class=service_C>
<center>
		<br>
		<br>
		<table width='500'>
			
			<form action='/dessert/member/loginProc' method='post'>
				<tr >
					<td  width='350' align='center' >&nbsp;I&nbsp; D: <input type='input' name='id' placeholder="아이디를 입력하세요."  style="width:250px; height:40px"></td>
				</tr>
		
		
			<tr height='50'>
				<td width='350' align='center'>PW: <input type='password' name='pass' placeholder="비밀번호를 입력하세요"  style="width:250px; height:40px" ></td>
			</tr>

			<tr height='30'>
				<td align='center' >
				<input type="checkbox" 	name="cookieSave" value="쿠키저장"  > 아이디저장&nbsp; <p></p>
				<input type='submit' value='로그인'>&nbsp; 
				
			</form>
			
			<button onclick="location.href='/dessert/member/writeForm'">회원가입</button>
			<button onclick="location.href='/dessert/'" style="margin-left:5px">메인가기</button>
						
			</td>
			</tr>
		</table>
	</center>
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