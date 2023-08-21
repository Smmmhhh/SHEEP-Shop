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
	<div class="secondWrap">
			<!-- [3] myPage box div -->
			<div class="secondWrap">
				<jsp:include page="../static/html/myPageMenu.html" />

				<!-- [4] 메인(order_box div-->
				<div class="orderBox">
					<!-- [4]-1 order_search -->
					<h3 id = "orderListTitle">주문 목록</h3>
					<div class="orderSearch">
						<input type="text" class="orderSearchInput"
							placeholder="주문한 상품을 검색하세요." required>
						<button type="submit" class="orderSearchButton">검색</button>
					</div>
					<!-- [4]-2 order_list-->

				</div>
			</div>
	</div>

	<!-- [6] footer  -->
	<jsp:include page="../static/html/footer.html" />

</body>

</html>