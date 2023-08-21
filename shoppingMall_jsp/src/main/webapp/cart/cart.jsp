<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 장바구니</title>
<link rel="stylesheet" href="../myPage/myPage.css">
<link rel="stylesheet" href="cart.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<%
	String memberID = (String) session.getAttribute("memberID");
	request.getParameter("ProdID");
	request.getParameter("memberID");
	request.getParameter("cartQuantity");

	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");

CartDAO cartDAO = new CartDAO();
List<Cart> cartList = cartDAO.getCartList(memberID);

	<!-- [1] header-->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 페이지정보 -->
	<div class="secondWrap">
		<div class="wrap">
			<div class="cartBox">
				<h2>장바구니</h2>
			</div>
			<div class="test">

				<!-- [3] 메뉴 -->
				<jsp:include page="../static/html/myPageMenu.html" />

				<!-- [4] 메인(cart_list) -->
				<div class="cart_box">
					<div class="cart_list">
						<div class="wrapBox">
							<div class="listBox">
								<div class="option_box">
									<div class="all_checkbox">
										<input type="checkbox" class="selectAll">전체 선택
									</div>
									<button class="delete_button" id="delete">삭제</button>
								</div>
								<table class="cart_table">

								</table>
							</div>
							<div class="total">총 상품가격 : 0</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="second_wrap">
		<form action="../payment/paymentAction.jsp" method="post">
			<input id="orderButton" type="submit" value="주문">
			<input type="hidden" name="paymentMethod" value="2">
		</form>
	</div>

	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


	<script>
		// 백엔드에서 가져온 데이터를 시뮬레이션한 배열
	
// 		var productsData = [ {
// 			name : '상품1',
// 			price : 10000,
// 			quantity : 2,
// 			image : '../image/logo.png'
// 		}, {
// 			name : '상품2',
// 			price : 20000,
// 			quantity : 3,
// 			image : '../image/coffee_image_1.jpg'
// 		}, {
// 			name : '상품3',
// 			price : 20000,
// 			quantity : 3,
// 			image : '../image/coffee_image_1.jpg'
// 		} ];

		<%
		// 현재 장바구니&상품정보 리스트 가져오기
// 			List<Composition> cartList = new ArrayList<>();
// 			CompositionDAO compDAO = new CompositionDAO();
// 			cartList = compDAO.selectCartList(memberID);
		%>
		
		// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
		function renderProducts(cartList) {
			var cartTable = document.querySelector('.cart_table');
			var tableContent = '';

			for (var i = 0; i < compList.size(); i++) {
				var product = products[i];
				tableContent += '<tr>'
						+ '<th><input type="checkbox" class="cartProduct"></th>'
						+ '<td><img src="' + product.image + '" alt="상품 이미지" width="100px" height="100px"></td>'
						+ '<td><div>'
						+ product.name
						+ '</div></td>'
						+ '<td>'
						+ '<div class="cart_quantity">'
						+ '<button class="quantity_button" data-change="-1">-</button>'
						+ '<input type="text" class="quantity_input" name="quantity" value="' + product.quantity + '">'
						+ '<button class="quantity_button" data-change="1">+</button>'
						+ '</div>' + '</td>' + '<td>'
						+ '<div class="cart_price">' + '<div>가격</div>'
						+ '<div>' + product.price + '</div>' + '</td>'
						+ '</tr>';
			}

			cartTable.innerHTML = tableContent;

			// 수량 증감 버튼에 이벤트 리스너 추가
			var quantityButtons = document.querySelectorAll('.quantity_button');
			quantityButtons.forEach(function(button) {
				button.addEventListener('click', function() {
					var change = parseInt(button.getAttribute('data-change'));
					updateQuantity(this, change);
				});
			});

			// 동적으로 생성되는 체크박스들의 상태 변경을 위한 부모 요소 선택
			var dynamicCheckboxContainer = document
					.querySelector('.cart_table');

			// 전체 선택 버튼 요소 가져오기
			const selectAllCheckbox = document.querySelector('.selectAll');

			// 동적 체크박스들의 NodeList 가져오기
			const dynamicCheckboxes = dynamicCheckboxContainer
					.querySelectorAll('.cartProduct');

			// 전체 선택 버튼 클릭 시 이벤트 처리
			selectAllCheckbox.addEventListener('change', function() {
				const isChecked = selectAllCheckbox.checked;

				// 전체 선택 버튼이 선택될 때 동적 체크박스들의 상태 변경
				dynamicCheckboxes.forEach(function(checkbox) {
					checkbox.checked = isChecked;
				});
			});

			// [2] 선택된 상품만 삭제하기
			const deleteButton = document.getElementById("delete"); // 삭제 버튼 요소 가져오기

			deleteButton.addEventListener('click', function(event) {
				event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

				// 선택된 체크박스 확인하여 삭제 처리
				dynamicCheckboxes.forEach(function(checkbox) {
					if (checkbox.checked) {
						const row = checkbox.closest('tr'); // 선택된 체크박스의 가장 가까운 <tr> 요소 가져오기
						row.remove(); // 해당 행 삭제
					}
				});

				// 전체 선택 체크박스도 해제
				selectAllCheckbox.checked = false;
			});

		}

		// 수량 업데이트 함수
		function updateQuantity(button, change) {
			var inputField = button.parentElement
					.querySelector('.quantity_input');
			var currentQuantity = parseInt(inputField.value);
			var newQuantity = currentQuantity + change;

			if (newQuantity < 1) {
				newQuantity = 1;
			}

			inputField.value = newQuantity;
		}

		// 화면이 로드되었을 때 실행
		window.addEventListener('DOMContentLoaded', function() {
			renderProducts(productsData);
		});
	</script>

</body>
</html>