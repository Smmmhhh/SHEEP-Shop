<!--   
  annotation Name : cancelMember jsp
  User: MHJ
  Date: 2023-08-16
  Time: 오후 3:00
-->

<%@page import="java.io.PrintWriter"%>
<%@page import="member.Member"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원 탈퇴</title>
<link rel="stylesheet" href="cancelMember.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>

<%
	request.setCharacterEncoding("UTF-8");
	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
%>

	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(cancel box) -->
	<div class="cancel-wrapper">
		<div class="cancel-Box">
			<h2>회원 탈퇴</h2>
			<form method="post" action="cancelAction.jsp" id="cancel-form">
				<input type="text" name="memberID" value="<%= memberID %>" placeholder="Id" readonly> 
				<input type="password" name="memberPW" placeholder="Password">
				<input type="submit" value="탈퇴하기"> 
			</form>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html" />
</body>

</html>