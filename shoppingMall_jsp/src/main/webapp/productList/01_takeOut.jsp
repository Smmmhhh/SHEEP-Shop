<!-------------------------------
  annotation Name : 01_takeout HTML
  User: SMH
  Date: 2023-08-11
  Time: 오후 9:33
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 상품 리스트</title>
<link rel="stylesheet" href="productList.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="productList.js"></script>

</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.html" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.html" />
	<!-- [3] 상품 리스트 div 생성 -->
	<div class="productBox">
		<!-- [3]-1 Text & List 생성 -->
		<div class="prodNavbar">
			<div class="text">
				<b> </b>
			</div>
			<div class="list">
				<ul id="menu">
					<li><a href="#"><b>낮은 가격순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>높은 가격순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>판매량순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>최신순</b></a></li>
				</ul>
			</div>
		</div>
		<!-- [3]-2 ProductList 생성 -->
		<div class="products">

			<a href="#" class="product"> <img
				src="../image/iceTakeoutCup.jpg" width="170px">
				<div class="product-name">[쉼 페트컵] 7온스(1000개 / 1박스)</div>
				<div class="product-price">18,900</div>
		</div>
	</div>

	<script>
	// 상품 정보를 담을 클래스 
	class ProdictInform{
		String imgurl
		ProdictInform(imgurl, productName)
		
	}
	</script>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

</body>
</html>