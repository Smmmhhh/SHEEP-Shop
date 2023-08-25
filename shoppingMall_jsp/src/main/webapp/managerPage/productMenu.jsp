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
<link rel="stylesheet" href="../adminMenu/adminMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>

	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="menu-wrapper">
		<div class="menuDiv" id="prodInsertMenu">
			<h1>상품 정보 등록</h1>
		</div>
		<div class="menuDiv" id="prodEditMenu">
			<h1>상품 정보 수정</h1>
		</div>
		<div class="menuDiv" id="prodDeleteMenu">
			<h1>상품 정보 삭제</h1>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>
	
	<script>
		var clickableInsertMenu = document.getElementById("prodInsertMenu");
	
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableInsertMenu.addEventListener("click", function() {
	        window.location.href = "productInsert.jsp";
    	});
	    
	    var clickableEditMenu = document.getElementById("prodEditMenu");
		
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableEditMenu.addEventListener("click", function() {
	        window.location.href = "productEditSelect.jsp";
    	});
	    
	    var clickableDeleteMenu = document.getElementById("prodDeleteMenu");
		
	    // div를 클릭할 때 이동할 URL로 리다이렉션
	    clickableDeleteMenu.addEventListener("click", function() {
	        window.location.href = "productDelete.jsp";
    	});
	</script>

</body>

</html>