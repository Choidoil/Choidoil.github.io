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


<title>댓글달기</title>
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
	<li><a class="navbar_font" href="../member/list">회원관리</a></li>
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
     	
		<h3><a>상세보기</a></h3><hr>
		
 	 </div>

	<div class=service_C align="center">
	
<p></p><p></p>

<table width="500" >
	<form action="reply" method="post">
		<input type="hidden" name="num" value="${reply_view.num}" style="width:381px; height:40px"  >
		<input type="hidden" name="ref" value="${reply_view.ref}" style="width:381px; height:40px"  >
		<input type="hidden" name="re_step" value="${reply_view.re_step}" style="width:381px; height:40px"  >
		<input type="hidden" name="re_level" value="${reply_view.re_level}" style="width:381px; height:40px"  >
		
		<tr>
			<th>번호</th>
			<td><input type="text" name="num" style="width:381px; height:40px"  value="${reply_view.num}" readonly/ ></td>
		</tr>
		
		<tr>
			<th>조회수</th>
			<td><input type="text" name="readcount" style="width:381px; height:40px"  value="${reply_view.readcount}" readonly/ ></td>
		</tr>
		
		<tr>
			<th>게시일자</th>
			<td><input type="text" name="reg_date" style="width:381px; height:40px"  value="${reply_view.reg_date}" readonly/ ></td>
		</tr>
	
		<tr>
			<th>*게시자</th>
			<td><input type="text" name="writer" style="width:381px; height:40px"  value="&lt;&lt;댓글자"></td>
		</tr>
		<tr>
			<th>*이메일</th>
			<td><input type="text" name="email" style="width:381px; height:40px" ></td>
		</tr>
		<tr>
			<th>*패스워드</th>
			<td><input type="password" name="password" style="width:381px; height:40px" ></td>
		</tr>
		<tr>
			<th>*제목</th>
			<td><input type="text" name="subject" style="width:381px; height:40px"  value="&lt;re&gt; ${reply_view.subject }"></td>
		</tr>
		<tr>
			<th>*내용</th>
			<td><textarea  name="content" rows="10" cols="47" style="width:381px; height:200px"  >&lt;re&gt;${reply_view.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="댓글"><a href="list">목록가기</a>
		</tr>
	
	</form>
</table>
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

</body>
</html>