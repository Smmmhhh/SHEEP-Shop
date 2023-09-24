<!--   
  annotation Name : login jsp
  User: MHJ
  Date: 2023-08-15
  Time: 오후 5:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : Login</title>
<link rel="stylesheet" href="../shop_main/main.css">
<link rel="stylesheet" href="login.css">

</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="login-wrapper">
		<div class="loginBox">
			<h2>Login</h2>
			<form method="post" action="loginAction.jsp" id="login-form">
				<input type="text" name="memberID" placeholder="Id"> 
				<input type="password" name="memberPW" placeholder="Password">
				<input type="submit" value="Login"> 
			</form>
			<div id="JoinBox">
				<a href="../joinMember/joinMember.jsp">Join</a>
			</div>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html" />
</body>

</html>