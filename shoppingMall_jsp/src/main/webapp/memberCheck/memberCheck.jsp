<!--
	annotation Name : memberCheck jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 8:38
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memberID = (String) session.getAttribute("memberID");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원정보 확인</title>
<link rel="stylesheet" href="memberCheck.css">
<link rel="stylesheet" href="../index.css">
</head>

<body>

	<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<form action="../memberCheck/memberCheckAction.jsp" method="post" id="pw-form">
		<div class="wrap">
	
			<!-- [2] page_info -->
			<div class="page_info">
				<h1>회원정보 확인</h1>
			</div>
	
			<!-- [3]-->
			<br>
			<h3><%= memberID %> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h3>
			<br>
	
			<!-- [4] -->
			<div class="check_id">
				<h2>아이디</h2>
				<input type="text" name="memberID" value="<%=memberID%>" class="checkInput" readonly>
			</div>
			<div class="check_pw">
				<h2>비밀번호</h2>
				<input type="password" name="memberPW" class="checkInput" placeholder="Password 입력">
			</div>
			<div class="button-group">
				<input type="submit" value="확인" class="button">
				<input type="reset" value="취소" class="button">
			</div>
		</div>
	</form>
	
	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html" />
	<script>
        includeHTML();
    </script>
</body>
</html>