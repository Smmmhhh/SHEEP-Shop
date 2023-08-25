<!--
	annotation Name : buyCheck jsp
    User: KJS
    Date: 2023-08-16
    Time: 오후 6:13
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쉼 : 주문목록 조회</title>
<link rel="stylesheet" href="buyCheck.css">
<link rel="stylesheet" href="../myPage/myPage.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>
	<!-- [1] header-->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">
	
	<!-- [2] 페이지정보 -->
	<div class="secondWrap">
		<div class="wrap">
			<div class="buyBox">
				<h2>주문목록 조회</h2>
			</div>
			<div class="test">

				<jsp:include page="../static/html/myPageMenu.html" />

				<!-- [4] 메인(order_box div-->
				<div class="orderBox">
					<!-- [4]-1 order_search -->
					<div class="orderSearch">
						<input type="text" class="orderSearchInput"
							placeholder="주문한 상품을 검색하세요." required>
						<button type="submit" class="orderSearchButton">검색</button>
					</div>
					<!-- [4]-2 order_list-->
					<div class="orderList">
						<div class="table">
							<div class="InfoTitle">
								<table class="InfoTable" id="buyInfoTable">
									<!-- 동적으로 생성된 행이 여기에 추가될 것입니다. -->
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		// 백엔드에서 가져온 데이터를 시뮬레이션한 배열
		var productsData = [ {
			name : '상품1',
			price : 10000,
			quantity : 2,
			image : '../image/logo.png'
		}, {
			name : '상품2',
			price : 20000,
			quantity : 3,
			image : '../image/coffee_image_1.jpg'
		}, {
			name : '상품3',
			price : 20000,
			quantity : 3,
			image : '../image/coffee_image_1.jpg'
		} ];

		// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
		function renderProducts(products) {
			var buyTable = document.querySelector('#buyInfoTable');
			var tableContent = '';

			for (var i = 0; i < products.length; i++) {
				var product = products[i];
				tableContent += '<tr>'
						+ '<th><img src="' + product.image + '" alt="' + product.name + '"></th>'
						+ '<td>' + '<div><strong>제품명:</strong> ' + product.name
						+ ' </div>' + '<div><strong>가격:</strong> '
						+ product.price + '원</div>'
						+ '<div><strong>수량:</strong> ' + product.quantity
						+ '</div>' + '</td>' + '</tr>';
			}

			buyTable.innerHTML = tableContent;
		}

		// 화면이 로드되었을 때 실행
		window.addEventListener('DOMContentLoaded', function() {
			renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
		});
	</script>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


</body>

</html>