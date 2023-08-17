<!--
	annotation Name : myPage jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 6:45
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<%

	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : MyPage</title>
<link rel="stylesheet" href="myPage.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 나의 정보(my info) -->
	<div class="wrap2">
		<div class="wrap">
			<div class="myinfo_bar">
				<div class="myinfo_box">
					<h2>My 정보</h2>
				</div>
				<div class="mypoint">
					<h3>보유 포인트</h3>
				</div>
			</div>
			<!-- [3] myPage box div -->
			<div class="second_wrap">
				<div class="my_box">
					<div class="myshop">
						<h2>My 쇼핑</h2>
						<h3>
							<a href="myPage.html" target="_blank">주문목록 조회</a>
						</h3>
						<h3>
							<a href="#" target="_blank">반품 조회</a>
						</h3>
					</div>
					<div class="myact">
						<h2>My 활동</h2>
						<h3>
							<a href="#" target="_blank">장바구니</a>
						</h3>
						<h3>
							<a href="#" target="_blank">1:1 문의하기</a>
						</h3>
					</div>
					<div class="myinfo">
						<h2>My 정보</h2>
						<h3>
							<a href="../memberCheck/memberCheck.jsp">개인정보 수정</a>
						</h3>
						<h3>
							<a href="#" target="_blank">포인트 충전하기</a>
						</h3>
					</div>
				</div>
				<!-- [4] 메인(order_box div-->
				<div class="order_box">
					<!-- [4]-1 order_search -->
					<h3>주문 목록</h3>
					<div class="order_search">
						<input type="text" class="ordersearch-input"
							placeholder="주문한 상품을 검색하세요." required>
						<button type="submit" class="ordesearch-button">검색</button>
					</div>
					<!-- [4]-2 order_list-->
				
				</div>
			</div>
		</div>
	</div>

	<!-- [6] footer  -->
	<jsp:include page="../static/html/footer.html" />

</body>

</html>