<!--   
  annotation Name : paymentConfirmAction jsp
  User: MHJ
  Date: 2023-08-17
  Time: 오후 3:06
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="member.*"%>
<%@ page import="composition.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 결제최종</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
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
	String phoneNo = null;
	String address = null;
	// 휴대폰 번호 받아오기
	if (request.getParameter("phoneNo") != "") {
		phoneNo = request.getParameter("phoneNo");
		//System.out.println(phoneNo);
	}
	// 주소 받아오기
	if (request.getParameter("address") != "") {
		address = request.getParameter("address");
		//System.out.println(address);
	}
	%>

	<%
	int prodID = Integer.MIN_VALUE;
	int prodQuantity = Integer.MIN_VALUE;
	int buttonMethod = Integer.MIN_VALUE;

	// 버튼 메소드 받아오기 (0 : 장바구니, 1: 바로결제)
	if (request.getParameter("buttonMethod") != "") {
		buttonMethod = Integer.parseInt(request.getParameter("buttonMethod"));
		//System.out.println(buttonMethod);
	}

	// Composition 객체 생성, CompositionList 생성
	CompositionDAO compositionDAO = new CompositionDAO();
	List<Composition> compList = new ArrayList<>();

	if (buttonMethod == 0) {
		//장바구니일때 고객의 전체상품 리스트 불러오기(오버로딩으로 구현함 반환타입 list)
		compList = compositionDAO.getCompositionList(member.getMemberID());
	} else {

		// 바로결제 시 상품번호 받아오기
		if (request.getParameter("prodID") != "") {
			prodID = Integer.parseInt(request.getParameter("prodID"));
			//System.out.println(ProdID);
		}
		// 바로 결제 시 상품 수량 받아오기
		if (request.getParameter("prodQuantity") != "") {
			prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
			//System.out.println(prodQuantity); 	
		}

		// 단일 상품일 때 고객의 선택한 상품만 불러오기(오버로딩으로 구현함 반환타입 Cart)
		compList.add(compositionDAO.getCompositionList(memberID, prodID));

		//System.out.println(compList.get(0).getProduct().getProdName());
	}
	%>

	<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />

	<!-- [2] Nav -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] Main(buy Page) -->
	<div class="buyTable">
		<!-- 3-1 유저정보 테이블 -->

		<form action="paymentAction.jsp?&prodID=<%=prodID%>&prodQuantity=<%=prodQuantity%>&buttonMethod=<%=buttonMethod%>&phoneNo=<%=phoneNo%>&address=<%=address%>" method="post">
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
					<td><%=phoneNo%></td>
				</tr>

				<tr>
					<th>배송지</th>
					<td><%=address%></td>
				</tr>

			</table>

			<!-- 3-2 구매품목 테이블 -->
			<div class="InfoTitle">구매품목</div>
			<table class="InfoTable" id="buyInfoTable">

				<tr>
					<td>이미지</td>
					<td>상품명</td>
					<td>수량</td>
					<td>가격</td>
					<td>총 가격</td>
				</tr>

				<%
				int totalPrice = 0;
				for (int i = 0; i < compList.size(); i++) {
					if (buttonMethod == 1) {
						totalPrice += compList.get(i).getProduct().getProdPrice() * prodQuantity;
					} else {
						totalPrice += compList.get(i).getProduct().getProdPrice() * compList.get(i).getCart().getCartQuantity();
					}
				%>
				<tr>
					<td><img
						src="../image/<%=compList.get(i).getProduct().getProdCtgID()%>_<%=compList.get(i).getProduct().getProdID()%>.jpg"></td>
					<td><%=compList.get(i).getProduct().getProdName()%></td>

					<!-- 바로결제시 선택 한 상품 수량만 넘어가야함. -->
					<%
					if (buttonMethod == 1) {
					%>
					<td><%=prodQuantity%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice())%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice() * prodQuantity)%></td>

					<!-- 장바구니에서 결제하기 클릭 시 고객의 전체 구매 리스트 불러오기 -->
					<%
					} else {
					%>
					<td><%=compList.get(i).getCart().getCartQuantity()%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice())%></td>
					<td><%=new DecimalFormat()
		.format(compList.get(i).getProduct().getProdPrice() * compList.get(i).getCart().getCartQuantity())%></td>
					<%
					}
					%>
				</tr>

				<%
				}
				%>

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
					<td><%=new DecimalFormat().format(totalPrice)%></td>
				</tr>

				<tr>
					<th>보유 포인트</th>
					<td><%=new DecimalFormat().format(memberPoint)%></td>
				</tr>
			</table>
			<div class="buttonWrap">
				<input type="submit" id="payButton" value="결제하기">
				<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
			</div>
		</form>

	</div>

	<!-- 3-4 알림창을 띄우는 버튼 -->
	
	
	
	<!-- 커스텀 알림창 모달 -->
	<div id="pointChargeModal" class="modal">
		<div id="wrapModal">
			<div class="modalContent">
				<span id="closeButton">&times;</span>
				<!-- 모달 창 닫기(X) 버튼 -->
				<h5>보유 포인트가 부족합니다!</h5>
				<h2>포인트 충전</h2>
				<div class="lineModal">
					<hr>
				</div>
				<form
					action="pointChargeAction.jsp?&prodID=<%=prodID%>&prodQuantity=<%=prodQuantity%>&buttonMethod=<%=buttonMethod%>&phoneNo=<%=phoneNo%>&address=<%=address%>&buttonMethod<%=buttonMethod%>"
					class="fromSubmit" method="post">
					<div>
						<h3>충전금액을 입력해 주세요.</h3>
						<input type="text" name="money" placeholder="입력" pattern="^\d+$" 
						title="숫자만 입력해주세요." required>
						<div class="lineModal">
							<hr>
						</div>
						<h3>결제카드</h3>
						<input type="text" name="paymentCard" placeholder="카드번호를 입력하세요."
								pattern="^\d{4}-\d{4}-\d{4}-\d{4}$"
								title="0000-0000-0000-0000 형식으로 입력해주세요."
								style="width: 300px" required>
					</div>
					<div class="buttonWrap">
						<input type="submit" name="charge" value="충전하기" id="finishButton">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>
</body>



<!-- [5] 스크립트 -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const payButton = document.getElementById('payButton');
		const pointChargeModal = document.getElementById('pointChargeModal');
		const closeButton = document.getElementById('closeButton');
		const finishButton = document.getElementById('finishButton');
		const totalPrice =
<%=totalPrice%>
	; // 서버에서 넘겨받은 총 결제 금액
		const memberPoint =
<%=memberPoint%>
	; // 서버에서 넘겨받은 보유 포인트

		payButton.addEventListener('click', function(event) {
			if (memberPoint < totalPrice) {
				event.preventDefault(); // 기본 동작(폼 제출)을 막습니다.
				pointChargeModal.style.display = 'block'; // 포인트 충전 모달 띄우기
			}
		});

		closeButton.addEventListener('click', function() {
			pointChargeModal.style.display = 'none'; // 모달 숨기기
		});

		finishButton.addEventListener('click', function() {
			pointChargeModal.style.display = 'none'; // 모달 숨기기
		});
	});
</script>

</html>
