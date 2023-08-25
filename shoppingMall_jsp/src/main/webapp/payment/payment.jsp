<!--   
  annotation Name : payment jsp
  User: MHJ
  Date: 2023-08-17
  Time: 오후 4:30
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>

<%
String memberID = (String) session.getAttribute("memberID");

if (memberID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = '../login/login.jsp';");
	script.println("</script>");
}

MemberDAO memberDAO = new MemberDAO();
Member member = memberDAO.selGetUserInfo(memberID);

String memberName = "";
String memberPhoneNo = "";
String memberAddress = "";
int memberPoint = 0;

if (member != null) {

	memberName = member.getMemberName();
	memberPhoneNo = member.getMemberPhoneNo();
	memberAddress = member.getMemberAddress();
	memberPoint = member.getMemberPoint();

} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('고객 정보를 가져오는 데 실패하였습니다!');");
	script.println("history.back();");
	script.println("</script>;");
	script.close();
	return;
}
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 주문자 정보 입력</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>

	<script>
		// 체크박스 작업
		document.addEventListener('DOMContentLoaded', function() {
			const checkboxPH = document.getElementById('samePhoneNo');
			const inputFieldPH = document.getElementById('phoneNoInput');

			checkboxPH.addEventListener('change', function() {
				if (checkboxPH.checked) {
					inputFieldPH.value = '<%=memberPhoneNo%>';
				} else {
					inputFieldPH.value = '';
				}
			});
			
			const checkboxAD = document.getElementById('sameAddress');
			const inputFieldAD = document.getElementById('addressInput');

			checkboxAD.addEventListener('change', function() {
				if (checkboxAD.checked) {
					inputFieldAD.value = '<%=memberAddress%>';
				} else {
					inputFieldAD.value = '';
				}
			});
		});

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

		<form action="paymentAction.jsp" method="post">
			<div class="InfoTitle">구매자 정보</div>
			<table class="InfoTable" id="userInfoTable">
				<tr>
					<th>아이디</th>
					<td><%=memberID%></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td><%=memberName%></td>
				</tr>

				<tr>
					<th>휴대폰 번호</th>
					<td>
						<div class="inputBox" style="padding: 0;">
							<input type="text" id="phoneNoText" value="<%=memberPhoneNo%>"
								readonly> <input type="text" id="phoneNoInput"
								placeholder="전화번호 입력"> <input type="checkbox" id="samePhoneNo">주문자
							전화 번호와 동일
						</div>
					</td>
				</tr>

				<tr>
					<th>배송지</th>
					<td>
						<div class="inputBox" style="padding: 0;">
							<input type="text" id="phoneNoText" value="<%=memberAddress%>"
								readonly> <input type="text" id="addressInput"
								placeholder="주소 입력"> <input type="checkbox" id="sameAddress">주문자
							배송지와 동일
						</div>
					</td>
				</tr>

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
					<th>배송비</th>
					<td>무료</td>
				</tr>

				<tr>
					<th>총 결제 금액</th>
					<td>결제금액 view</td>
				</tr>

				<tr>
					<th>보유 포인트</th>
					<td><%=memberPoint%></td>
				</tr>
			</table>
			<div class="buttonWrap">
				<button id="payButton" value="결제"
					onclick="location.href='../payment/paymentAction.jsp'">결제</button>
			</div>
		</form>

	</div>

	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>

</body>

</html>