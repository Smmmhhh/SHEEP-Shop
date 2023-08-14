<!--   
  annotation Name : Login Css
  User: MHJ
  Date: 2023-08-13
  Time: 오후 8:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 관리자메뉴</title>
<link rel="stylesheet" href="adminMenu.css">
<link rel="stylesheet" href="../index.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.html"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 메인(login box) -->
	<div class="menu-wrapper">
		<button class="menuButton" id="userMenu">
			<h1>회원 관리</h1>
		</button>
		<button class="menuButton" id="productMenu">
			<h1>상품 관리</h1>
		</button>
		<button class="menuButton" id="dataMenu">
			<h1>쇼핑몰 데이터</h1>
		</button>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>
	<script>
        includeHTML();
    </script>
</body>

</html>