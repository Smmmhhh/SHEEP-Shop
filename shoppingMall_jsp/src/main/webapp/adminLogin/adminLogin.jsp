<!--   
  annotation Name : Login Css
  User: MHJ
  Date: 2023-08-13
  Time: 오후 7:40
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : Login</title>
<link rel="stylesheet" href="adminLogin.css">
<link rel="stylesheet" href="../index.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.html"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="login-wrapper">
		<div class="loginBox">
			<h2>Login</h2>
			<form method="post" action="서버의url" id="login-form">
				<input type="text" name="userName" placeholder="Id"> <input
					type="password" name="userPassword" placeholder="Password">
				<input type="submit" value="Login"> <input type="submit"
					value="Join">
			</form>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>

</body>

</html>