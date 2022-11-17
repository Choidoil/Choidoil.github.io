<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 배치처리 폼</title>
</head>
<body>
<h1 align="center">회원가입배치처리(한꺼번에여럿처리)</h1><hr>
<form action="joinBatch" method="post">
	<table width="600" align="center" border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>연령대</th>
			<th>직업</th>
			<th>취미</th>
		</tr>
		<tr>
			<td colspan="7">
			<div align="center">순서에 맞춰 컴마로 나열하세요(여러줄 작성 가능)</div>
			예보기: hongGD,1234,HGD@naver.com,010-2222-3333,30대,개발프리렌스,노래하기	
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<textarea rows="10" cols="100" name="batchData"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="8">
				<input type="submit" value="배치처리">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="list">회원목록</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>