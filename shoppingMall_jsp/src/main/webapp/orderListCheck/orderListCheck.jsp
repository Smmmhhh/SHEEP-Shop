<!--
	annotation Name : buyCheck jsp
    User: KJS
    Date: 2023-08-16
    Time: 오후 6:13
 -->

<%@page import="product.Product"%>
<%@page import="orderProduct.OrderProduct"%>
<%@page import="orderProduct.OrderProductDAO"%>
<%@page import="order.Order"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="composition.CompositionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="composition.Composition"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쉼 : 주문목록 조회</title>
<link rel="stylesheet" href="orderListCheck.css">
<link rel="stylesheet" href="../myPage/myPage.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>
	<%
		String memberID = (String) session.getAttribute("memberID");
	
		if (memberID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../login/login.jsp';");
			script.println("</script>");
		}
	%>
	<!-- [1] header-->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">
	
	<!-- [2] 나의 정보(my info) -->
	<div class="secondWrap">
	<!-- [3] myPage box div -->
	<div class="secondWrap">
	
	<jsp:include page="../static/html/myPageMenu.html" />
	
	<%
		List<Composition> orderList = new ArrayList<>();
		
		CompositionDAO compositionDAO = new CompositionDAO();

		orderList = compositionDAO.getOrderList(memberID);
												
		int count=0;
		
		if(orderList.size()==0) {
			%>	
			<div id="emptyBox">
				주문내역 없음
			</div>
			<%
		}
	%>
	<!-- [4] 메인(order_list) -->
	<div class="order_box">

		<div class="order_list">		
			<!-- 장바구니 목록 동적 생성 -->
			<div class="order_div">
				
					<%
						
						for (int i = 0; i < orderList.size(); i+=count) {
							Order order = orderList.get(i).getOrder();
							
							int orderID = order.getOrderID();
							
							String orderAddress = order.getOrderAddress();
							String orderPhoneNo = order.getOrderPhoneNo();
							int totalPrice = order.getTotalPrice();
							String orderDate = order.getOrderDate();
							
							OrderProductDAO orderProductDAO = new OrderProductDAO();
							
							count = orderProductDAO.getOrderProductCount(orderID);
														
								%>	
								<div id="orderInfoBox">
									<div class="orderInfo">주문번호 : <%=orderID%></div>
									<hr>
									<div class="orderInfo">주문날짜 : <%=orderDate%></div>
									<hr>	
									<div class="orderInfo">배송지 : <%=orderAddress%></div>
									<hr>
									<div class="orderInfo">전화번호 : <%=orderPhoneNo%></div>
									<hr>
								</div>
							<table id="order_table" style="margin-bottom: 50px">
								<tr>
									<td>상품이미지</td>	
									<td>상품명</td>
									<td>가격</td>
									<td>주문수량</td>					
								</tr>
							<%
								for(int j=i; j < i+count; j++){
									
									Product product = orderList.get(j).getProduct();
									OrderProduct orderProduct = orderList.get(j).getOrderProduct();
									
									int prodID = product.getProdID();

									int ctgID = product.getProdCtgID();
									String prodName = product.getProdName();
									int prodPrice = product.getProdPrice();
									int orderQuantity = orderProduct.getOrderQuantity();	
							%>
		
								<tr>
								<td>
									<img src="../image/<%=ctgID%>_<%=prodID%>.jpg"
									alt="상품 이미지" width="100px" height="100px">
								</td>
								<td>
									<div><%=prodName%></div>
								</td>
								<td>
									<div>
										<div><%=prodPrice%></div>
									</div>
								</td>
								<td>
									<div>
										<div><%=orderQuantity%></div>
									</div>
								</td>
							
							<%
								}
							%>
							
						</table>
							<%		
							}
							%>
			</div>
				</div>
			</div>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


</body>

</html>