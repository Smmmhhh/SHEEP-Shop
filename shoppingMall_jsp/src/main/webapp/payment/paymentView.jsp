<!--   
  annotation Name : paymentView jsp
  User: MHJ
  Date: 2023-08-17
  Time: 오전 11:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>

<%
	String memberID = (String) session.getAttribute("memberID");
	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 구매 정보 확인</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>

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
						+ '<td>'
						+ '<div class="prodInfo"><strong>제품명:</strong> '
						+ product.name + ' </div>'
						+ '<div class="prodInfo"><strong>가격:</strong> '
						+ product.price + '원</div>'
						+ '<div class="prodInfo"><strong>수량:</strong> '
						+ product.quantity + '</div>' + '</td>' + '</tr>';
			}

			buyTable.innerHTML = tableContent;
		}

		// 화면이 로드되었을 때 실행
		window.addEventListener('DOMContentLoaded', function() {
			renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
		});
	</script>

	<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />

	<!-- [2] Nav -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] Main(buy Page) -->
	<div class="buyTable">
		<!-- 3-1 유저정보 테이블 -->
		<div class="InfoTitle">구매자 정보</div>
		<table class="InfoTable" id="userInfoTable">
			<%-- <tr>
				<th>이름</th>
				<td><%=memberName%></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><%=memberID%></td>
			</tr>

			<tr>
				<th>휴대폰 번호</th>
				<td><%=memberPhoneNo%></td>
			</tr>
			
			<tr>
				<th>배송지</th>
				<td><%=memberAddress%></td>
			</tr>
 --%>
		</table>

		<!-- 3-2 구매품목 테이블 -->
		<div class="InfoTitle">구매품목</div>
		<table class="InfoTable" id="buyInfoTable">
			<!-- 동적으로 생성된 행이 여기에 추가될 것입니다. -->
		</table>

		<!-- 3-3 결제정보 테이블 -->
		<div class="InfoTitle">결제정보</div>
		<table class="InfoTable" id="payInfoTable">
			<tr>
				<th>총 삼품 가격</th>
				<td>상품가격 view</td>
			</tr>

			<tr>
				<th>배송비</th>
				<td>무료</td>
			</tr>

			<tr>
				<th>총 결제 금액</th>
				<td>결제금액 view</td>
			</tr>

			<tr>
				<th>보유 포인트</th>
				<td>포인트 view</td>
			</tr>
		</table>
		<div class="buttonWrap">
			<button id="payButton" value="결제"
				onclick="location.href='../payment/paymentComp.jsp'">결제</button>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>

</body>

</html>