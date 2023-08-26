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
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="member.*"%>
<%@ page import="composition.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 주문자 정보 입력</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet" href="../shop_main/main.css">

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
	int buttonMethod = Integer.MIN_VALUE;
	

	// 버튼 메소드 받아오기 (0 : 장바구니, 1: 바로결제)
	if(request.getParameter("buttonMethod") != ""){
		buttonMethod = Integer.parseInt(request.getParameter("buttonMethod"));
		//System.out.println(buttonMethod);
	}
	
	// Composition 객체 생성, CompositionList 생성
	CompositionDAO compositionDAO = new CompositionDAO();
	List<Composition> compList = new ArrayList<>();
	
	if(buttonMethod == 0){		
		//장바구니일때 고객의 전체상품 리스트 불러오기(오버로딩으로 구현함 반환타입 list)
		compList = compositionDAO.getCompositionList(member.getMemberID());
	}else{
		
		// 바로결제 시 상품번호 받아오기
		if(request.getParameter("prodID") != ""){
			prodID = Integer.parseInt(request.getParameter("prodID"));
			//System.out.println(ProdID);
		}
		// 바로 결제 시 상품 수량 받아오기
		if(request.getParameter("prodQuantity") != ""){
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

		<form action="paymentConfirm.jsp?prodID=<%=prodID%>&prodQuantity=<%=prodQuantity%>&buttonMethod=<%=buttonMethod%>" method="post">
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
							<input type="text" id="phoneNoText" value="<%=memberPhoneNo%>" readonly> 
							<input type="text" id="phoneNoInput" placeholder="전화번호 입력" name="phoneNo"> 
							<input type="checkbox" id="samePhoneNo">주문자 전화 번호와 동일
						</div>
					</td>
				</tr>

				<tr>
					<th>배송지</th>
					<td>
						<div class="inputBox" style="padding: 0;">
							<input type="text" id="phoneNoText" value="<%=memberAddress%>" readonly> 
							<input type="text" id="addressInput" placeholder="주소 입력" name="address"> 
							<input type="checkbox" id="sameAddress">주문자 배송지와 동일
						</div>
					</td>
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
				for(int i = 0; i < compList.size(); i++){
					if(buttonMethod == 1){
						totalPrice += compList.get(i).getProduct().getProdPrice() * prodQuantity;
					}else{
						totalPrice += compList.get(i).getProduct().getProdPrice() * compList.get(i).getCart().getCartQuantity();
					}
			%>
				<tr>
					<td><img src="../image/<%=compList.get(i).getProduct().getProdCtgID()%>_<%=compList.get(i).getProduct().getProdID()%>.jpg"></td>
					<td><%=compList.get(i).getProduct().getProdName()%></td>
					
					<!-- 바로결제시 선택 한 상품 수량만 넘어가야함. -->
					<% if(buttonMethod == 1) {%> 
					<td><%=prodQuantity%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice())%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice()  * prodQuantity)%></td>
					
					<!-- 장바구니에서 결제하기 클릭 시 고객의 전체 구매 리스트 불러오기 -->
					<%} else {%>
					<td><%=compList.get(i).getCart().getCartQuantity()%></td>
						<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice())%></td>
					<td><%=new DecimalFormat().format(compList.get(i).getProduct().getProdPrice() * compList.get(i).getCart().getCartQuantity())%></td>
					<%}%>
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
				<input type="submit" id="payButton" value="확인">
			</div>

		</form>

	</div>

	<!-- [4] 푸터  -->
	<div class="footerDiv">
		<jsp:include page="../static/html/footer.html" />
	</div>

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
		

	</script>

</body>

</html>