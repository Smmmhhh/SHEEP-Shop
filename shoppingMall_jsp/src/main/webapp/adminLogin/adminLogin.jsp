<!--   
  annotation Name : Login Css
  admin: MHJ
  Date: 2023-08-13
  Time: 오후 7:40
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : adminLogin</title>
<link rel="stylesheet" href="adminLogin.css">
<link rel="stylesheet" href="../index.css">

<%
	String adminID = (String) session.getAttribute("adminID");
	if(adminID!=null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../adminMenu/adminMenu.jsp';");
		script.println("</script>");
	}
%>

</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="login-wrapper">
		<div class="loginBox">
			<h2>Login</h2>
			<form method="post" action="adminLoginAction.jsp" id="login-form">
				<input type="text" name="adminID" placeholder="Id"> 
				<input type="password" name="adminPW" placeholder="Password">
				<input type="submit" value="Login"> 
			</form>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>

</body>

</html>