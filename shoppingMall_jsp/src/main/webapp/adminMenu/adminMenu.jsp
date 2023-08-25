<!--   
  annotation Name : Login Css
  User: MHJ
  Date: 2023-08-13
  Time: 오후 8:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
	
	
<%
	String adminID = (String) session.getAttribute("adminID");
	if(adminID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../adminLogin/adminLogin.jsp';");
		script.println("</script>");
	}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 관리자메뉴</title>
<link rel="stylesheet" href="adminMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>

	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="menu-wrapper">
		<div class="menuDiv" id="userMenu">
			<h1>회원 관리</h1>
		</div>
		<div class="menuDiv" id="productMenu">
			<h1>상품 관리</h1>
		</div>
		<div class="menuDiv" id="dataMenu">
			<h1>쇼핑몰 데이터</h1>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>
	
	<script>
		var clickableUserMenu = document.getElementById("userMenu");
	
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableUserMenu.addEventListener("click", function() {
	        window.location.href = "../managerPage/userMenu.jsp";
    	});
	    
	    var clickableProdMenu = document.getElementById("productMenu");
		
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableProdMenu.addEventListener("click", function() {
	        window.location.href = "../managerPage/productMenu.jsp";
    	});
	    
	    var clickableDataMenu = document.getElementById("dataMenu");
		
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableDataMenu.addEventListener("click", function() {
	        window.location.href = "../managerPage/dataMenu.jsp";
    	});
	</script>

</body>

</html>