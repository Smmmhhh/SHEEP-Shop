<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 결제완료</title>
<link rel="stylesheet" href="../shop_main/main.css">
<link rel="stylesheet" href="../payment/paymentComp.css">
</head>
<body>

	<%
	// 유저 session //
	String memberID = (String) session.getAttribute("memberID");

	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
	%>

	<%
	// 데이터 받아오기
	int totalPrice = Integer.MIN_VALUE;
	String address = null;
	int afterPoint = Integer.MIN_VALUE;

	// 총 결제금액 받아오기 
	if (request.getParameter("totalPrice") != "") {
		totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		//System.out.println(totalPrice);
	}
	// 주소 받아오기
	if (request.getParameter("address") != "") {
		address = request.getParameter("address");
		//System.out.println(address); 	
	}

	// 결제 후 고객 포인트 받아오기
	if (request.getParameter("afterPoint") != "") {
		afterPoint = Integer.parseInt(request.getParameter("afterPoint"));
		//System.out.println(afterPoint);
	}
	%>

	<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />

	<!-- [2] Nav -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] Main -->
	<div id="paymentCompDiv">

		<!-- [3]-1 결제완료 텍스트 -->
		<div id="pamentCompText">
			<h1>결제가 완료되었습니다!</h1>
		</div>
		<!-- [3]-2 결제완료 텍스트 -->
		<div id="paymentInfrom">
			<h3>결제정보</h3>
			<table class="InfoTable" id="paymentCompTable">

				<tr>
					<td style="font-weight: bold; width: 150px">구매자 정보</td>
					<td><%=memberID%></td>
				</tr>
				<tr>
					<td style="font-weight: bold">총 상품 가격</td>
					<td><%=new DecimalFormat().format(totalPrice)%></td>
				</tr>
				<tr>
					<td style="font-weight: bold">배송주소</td>
					<td><%=address%></td>
				</tr>
				<tr>
					<td style="font-weight: bold">총 결제 금액</td>
					<td><%=new DecimalFormat().format(totalPrice)%></td>
				</tr>
				<tr>
					<td style="font-weight: bold">보유 포인트</td>
					<td><%=new DecimalFormat().format(afterPoint)%></td>
				</tr>
			</table>
		</div>
		<!-- [3]-3 버튼 -->
		<div id="paymentButton">

			<button class="custom-button"
				onclick="redirectToPage('../shop_main/main.jsp')">메인화면</button>
			<button class="custom-button"
				onclick="redirectToPage('../orderListCheck/orderListCheck.jsp')">주문목록</button>

		</div>



	</div>
	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>

	<script>
		function redirectToPage(option) {
			// 여기에 이동할 페이지의 URL을 입력합니다.
			var targetPage = option;

			window.location.href = targetPage;
		}
	</script>

</body>
</html>