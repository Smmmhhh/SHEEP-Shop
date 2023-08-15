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
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.html" />
	<!-- [3] 상품 리스트 div 생성 -->
	<div class="productBox">
		<!-- [3]-1 Text & List 생성 -->
		<div class="menubar">
			<div class="text">
				<b> '테이크아웃 용품' 검색결과 </b>
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

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 스위트 블랜드 1kg
                </div>
                <div class="product-price">
                    18,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 루나 블랜드 1kg
                </div>
                <div class="product-price">
                    18,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 로미 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 지선표 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 희진표 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] MINO 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 빈츠 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 참쌀 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

            <a href="#" class="product">
                <img src="../image/coffee_image_1.jpg" width="170px">
                <div class="product-name">
                    [쉼 원두] 쿠크다스 블랜드 1kg
                </div>
                <div class="product-price">
                    21,900
                </div>
            </a>

        </div>
	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

</body>
</html>