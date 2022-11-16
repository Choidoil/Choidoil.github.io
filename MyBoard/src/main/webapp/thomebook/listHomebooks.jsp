<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<%
request.setCharacterEncoding("UTF-8");
%>     
<!--------------------------------------------- XXXXXX---------------------------------------------------------------------------------------->   
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>가계부 정보 출력창</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        
<%
	String id = (String) session.getAttribute("login.id");
	if (id == null) {
		id = "GUEST";
	}
%>

<c:choose>
   <c:when test='${msg=="addHomebook" }'>
      <script>
         window.onload=function(){
            alert("가계부를 등록했습니다.");
         }
      </script>
   </c:when>
   <c:when test='${msg=="modified" }'>
      <script>
        window.onload=function(){
          alert("가계부 정보를 수정했습니다.");
        }
      </script>
   </c:when>
   <c:when test= '${msg=="deleted" }'>
      <script>
         window.onload=function(){
            alert("가계부 정보를 삭제했습니다.");
        } 
      </script>
</c:when>
</c:choose>

<style>
     .cls1 {
       font-size:40px;
       text-align:center;
     }
    
     .cls2 {
       font-size:20px;
       text-align:center;
     }
  </style>
        
    </head>
    
<!--------------------------------------------- XXXXXX---------------------------------------------------------------------------------------->    
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href='../Main.jsp'>비전 가계부</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-center" >
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       	<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../member/memberForm.do">회원가입</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../member/modMemberForm.do">본인정보</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../homebook/homebookForm.do">가계부입력</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../homebook/listHomebooks.do">회원자료</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../member/listMembers.do">모든회원</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="../board/listArticles.do">게시판</a></li>
                    </ul>
                </div>
            </div>
            
            <td align="center" width="200"><h3 class="y"><%=id%>님 &nbsp;&nbsp;&nbsp; 
				</h3> <%
 	if (id.equals("GUEST")) {
 %>
				<button class="btn btn-primary btn-xl " onclick="location.href='login/formLogin.jsp'">로그인</button>
				<%
					} else {
				%>
				<button class="btn btn-primary btn-xl " onclick="location.href='login/logout.jsp'">로그아웃</button>
				<%
					}
				%></td>
		</tr>
            &nbsp;&nbsp;&nbsp;
        </nav>
        
        
        
<!--------------------------------------------- XXXXXX---------------------------------------------------------------------------------------->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
               
		 <a class="masthead-avatar mb-6" ></a>
		 <p class="masthead-heading text-uppercase mb-5">가계부정보</p>
   <table align="center" border="1" class="cls2">

 
      <tr align="center" bgcolor="lightblue">
         <td nowrap width="7%" ><b>등록번호</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>등록일자</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>수지구분</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%"><b>계정과목</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>적요</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>수입금액</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>지출금액</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>회원아이디</b></td>&nbsp;&nbsp;&nbsp;
         <td nowrap width="7%" ><b>수정</b></td>&nbsp;&nbsp;&nbsp;
		 <td nowrap width="7%" ><b>삭제</b></td>&nbsp;&nbsp;&nbsp;
         
   </tr>

<c:choose>
    <c:when test="${empty  homebookList}" >
      <tr>
        <td colspan=10>
          <b>등록된 가계부 내역이 없습니다..</b>
       </td>  
      </tr>
   </c:when>  
   <c:when test="${!empty homebookList}" >
      <c:forEach  var="data" items="${homebookList }" >
        <tr align="center">
          <td nowrap>${data.serialno }</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.day}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.section }</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.accounttitle}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.remark}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.revenue}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.expense}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap>${data.mem_id}</td>&nbsp;&nbsp;&nbsp;
          <td nowrap bgcolor="lightgreen"><a href="${contextPath}/homebook/modHomebookForm.do?serialno=${data.serialno }">수정</a></td>
		  <td nowrap bgcolor="lightgreen"><a href="${contextPath}/homebook/delHomebook.do?serialno=${data.serialno }">삭제</a></td>
               
       </tr>
     </c:forEach>
</c:when>
</c:choose>
   </table>  
	
                
               
               <p class="masthead-subheading font-weight-light mb-5"></p>
        </div>       
  </header>
        
 <section class="page-section bg-primary text-white mb-0" id="about">
         <div class="container">     
         <div class="divider-custom divider-light">                
         </div>         
 </section>
<!--------------------------------------------- XXXXXX---------------------------------------------------------------------------------------->

               
        <!-- Footer-->    
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>대전광역시 중구 선화동 비젼빌딩 | 대표이사  아무개 | 사업자 등록번호  111-11-11111 | 
			상호 : 비젼캐피탈주식회사 | 전자우편주소 | 이용약관 | 통신판매업신고 |
			COPYRIGHT © VISION CAPITAL SERVICES. INC. ALL RIGHT RESERVED. </small></div>
        </div>
         
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
