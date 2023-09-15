<%@page import="orderProduct.OrderProduct"%>
<%@page import="product.Product"%>
<%@page import="order.Order"%>
<%@page import="orderProduct.OrderProductDAO"%>
<%@page import="composition.Composition"%>
<%@page import="composition.CompositionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="orderListCheck.css">
<style>
	.order_box{
		border: 1px solid;
		width: 450px;
		height: 300px;
		overflow: auto;
		overflow-x: hidden;
	}
	
	.order_table{
		margin: 
	}
</style>
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

	<div class="order_box">

		<div class="order_list">

			<!-- 장바구니 목록 동적 생성 -->

			<div class="order_div">

				<%
				List<Composition> orderList = new ArrayList<>();

				CompositionDAO compositionDAO = new CompositionDAO();

				orderList = compositionDAO.getOrderList(memberID);

				int count = 0;

				for (int i = 0; i < orderList.size(); i += count) {
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
				</div>
				<table id="order_table" style="margin-bottom: 50px">
					<tr>
						<td><div>상품이미지</div></td>
						<td><div>상품명</div></td>
						<td><div>가격</div></td>
						<td><div>주문수량</div></td>
					</tr>
					<%
					for (int j = i; j < i + count; j++) {

						Product product = orderList.get(i).getProduct();
						OrderProduct orderProduct = orderList.get(i).getOrderProduct();

						int prodID = product.getProdID();
						int ctgID = product.getProdCtgID();
						String prodName = product.getProdName();
						int prodPrice = product.getProdPrice();
						int orderQuantity = orderProduct.getOrderQuantity();
					%>

					<tr>
						<td><img src="../image/<%=ctgID%>_<%=prodID%>.jpg"
							alt="상품 이미지" width="100px" height="100px"></td>
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
</body>
</html>