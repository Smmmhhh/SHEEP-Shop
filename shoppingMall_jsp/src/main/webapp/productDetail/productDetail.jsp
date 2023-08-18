<!--
	annotation Name : productDetail jsp
    User: MHJ
    Date: 2023-08-14
    Time: 오후 1:00
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="category.Category"%>
<%@ page import="category.CategoryDAO"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 상품 개별 페이지</title>
<link rel="stylesheet" href="productDetail.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>
<body>

</head>
<body>
	<%
	//productList.jsp 에서 상품ID 가져오기 
	int prodID = Integer.parseInt(request.getParameter("prodID"));
	
	// prodID를 이용해서 현재 product Information가져오기
	ProductDAO productDAO = new ProductDAO();
	Product product = productDAO.selGetProdInfrom(prodID);
	%>
	<!-- [1] Header 추가 -->

	<jsp:include page="../static/html/header.jsp" />

	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] 상품 상세 내용 div 생성 -->
	
	<%
	//category ID 가져오기 
	product.getProdCtgID();
	//categery 이름 가져오기
	CategoryDAO CategoryDAO = new CategoryDAO();
	String ctgName = CategoryDAO.selectCtgName(product.getProdCtgID());
	%>

	<div id="category">
		<h3><%=ctgName%></h3>
	</div>
	<div class="product-details">
		<div>
			<img src="../image/<%=product.getProdCtgID()%>_<%=product.getProdID()%>.jpg" alt="상품 이미지" id="prodDetailImg">
		</div>
		<div class="details">
			<h2><%=product.getProdName()%></h2>
			<hr style="border: none; margin: 10px 0; border-top: 2px solid black">

			<h3 id="productDetail_price"><%=new DecimalFormat().format(product.getProdPrice())%>원</h3>

			<h4 id="delivery_fee">└ 배송비 : 무료</h4>

			<div class="quantity">
				<button class="quantity_button" id="decrement-button">-</button>
				<input type="text" id="quantity_input" name="quantity" value="1">
				<button class="quantity_button" id="increment-button">+</button>
			</div>

			<h4 class="description"><%=product.getProdDetail()%></h4>
			<div class="payButtonDiv">
				<button id="cartButton">장바구니 담기</button>
				<button id="payButton"
					onclick="location.href='../payment/payment.jsp'">바로 결제</button>
			</div>
		</div>

	</div>

	<div class="modal-overlay" id="modal">
		<div class="modal-content">
			<p>상품을 장바구니에 담았습니다.</p>
			<button class="modal-button" id="moveCart"
				onclick="location.href='../cart/cart.jsp'">장바구니로 이동</button>
			<button class="modal-button" id="closeButton">쇼핑 계속하기</button>
		</div>
	</div>


	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />
	<script>
		//모달창 띄우기
		document.getElementById("cartButton").addEventListener("click",
				function() {
					var modal = document.getElementById("modal");
					modal.style.display = "flex";
				});
		document.getElementById("closeButton").addEventListener("click",
				function() {
					var modal = document.getElementById("modal");
					modal.style.display = "none";
				});

		//수량 증감 버튼 동작 함수
		document.addEventListener("DOMContentLoaded",
				function() {
					const quantityInput = document
							.getElementById("quantity_input");
					const decrementButton = document
							.querySelector("#decrement-button");
					const incrementButton = document
							.querySelector("#increment-button");
					decrementButton.addEventListener("click", function() {
						updateQuantity(-1);
					});
					incrementButton.addEventListener("click", function() {
						updateQuantity(1);
					});
					quantityInput.addEventListener("input", function() {
						validateQuantityInput();
					});
					function updateQuantity(change) {
						let currentQuantity = parseInt(quantityInput.value);
						currentQuantity += change;
						if (currentQuantity < 1) {
							currentQuantity = 1;
						}
						quantityInput.value = currentQuantity;
					}
					// 수량 증감 입력 유효성 검사
					function validateQuantityInput() {
						let inputValue = quantityInput.value;
						inputValue = inputValue.replace(/\D/g, ''); // 숫자 이외의 문자 제거
						quantityInput.value = inputValue;
					}
				});
	</script>


</body>
</html>