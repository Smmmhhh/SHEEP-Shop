<!--   
  annotation Name : paymentAction jsp
  User: MHJ
  Date: 2023-08-17
  Time: 오후 3:06
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 결제최종</title>
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

	<%
	int prodID = Integer.MIN_VALUE;
	int prodQuantity = Integer.MIN_VALUE;

	if(request.getParameter("prodID") != ""){
		prodID = Integer.parseInt(request.getParameter("prodID"));
		//System.out.println(prodID);
	}

	if(request.getParameter("prodQuantity") != ""){
		prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
		System.out.println(prodQuantity);
	}
	%>

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
								placeholder="전화번호 입력"> <input type="checkbox"
								id="samePhoneNo">주문자 전화 번호와 동일
						</div>
					</td>
				</tr>

				<tr>
					<th>배송지</th>
					<td>
						<div class="inputBox" style="padding: 0;">
							<input type="text" id="phoneNoText" value="<%=memberAddress%>"
								readonly> <input type="text" id="addressInput"
								placeholder="주소 입력"> <input type="checkbox"
								id="sameAddress">주문자 배송지와 동일
						</div>
					</td>
				</tr>

			</table>

			<!-- 3-2 구매품목 테이블 -->
			<!-- 단일상품 결제 시 -->
			<%
			ProductDAO produtDAO = new ProductDAO();
			Product product = produtDAO.selGetProdInfrom(prodID);
			%>

			<div class="InfoTitle">구매품목</div>
			<table class="InfoTable" id="buyInfoTable">

				<tr>
					<td>이미지</td>
					<td>상품명</td>
					<td>수량</td>
					<td>가격</td>
					<td>총 가격</td>
				</tr>

				<tr>
					<td><img
						src="../image/<%=product.getProdCtgID()%>_<%=product.getProdID()%>.jpg"></td>
					<td><%=product.getProdName()%></td>
					<td><%=prodQuantity%></td>
					<td><%=new DecimalFormat().format(product.getProdPrice())%></td>
					<td><%=new DecimalFormat().format(product.getProdPrice() * prodQuantity)%></td>
				</tr>

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
					<td><%=new DecimalFormat().format(product.getProdPrice() * prodQuantity)%></td>
				</tr>

				<tr>
					<th>보유 포인트</th>
					<td><%=memberPoint%></td>
				</tr>
			</table>
			<div class="buttonWrap">
				<input type="submit" id="payButton" value="확인">
			</div>

		</form>

	</div>

	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>

</body>
</html>
