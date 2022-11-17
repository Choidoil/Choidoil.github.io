<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&family=Source+Sans+Pro:wght@600;900&display=swap" rel="stylesheet">
<link href="/dessert/resources/style.css" rel="stylesheet"/>


<title>수강신청리스트</title>
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

<div class="service">
    <div class="service_0">
    
    </div>

    <div class="service_L">
        
      <h3><a>신청내역</a></h3><hr>
      
     </div>

   <div class=service_C >

   <p></p>
   <p></p>   


<table width="90%" cellpadding="0" cellspacing="0" border="0" align="center" style="border-collapse: collapse;">
      <tr class=board >
   <th>예약번호</th>
   <th>수강생</th>
   <th>강의명</th>   
   <th>수강료</th>
   <th>상세정보</th>
   <th>과목</th>
   <th>예약취소</th>
   </tr>
   
<c:forEach items="${reserveData}" var="dto">
         <tr class=board >
            <td>${dto.regno }</td>
            <td>${dto.memid }</td>
            <td>${dto.name }</td>         
            <td>${dto.price }</td>
            <td>${dto.info }</td>
            <td>${dto.category }</td>         
            <td align="center">
            <button onclick="location.href='/dessert/reserve/delete?regno=${dto.regno}'">예약취소</button>
            </td>
         </tr>
</c:forEach>
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
   