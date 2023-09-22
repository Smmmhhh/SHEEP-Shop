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
<link rel="stylesheet" href="../orderListCheck/orderListCheck.css">

<style>
   .order_box{
      width: 820px;
      height: 300px;
      overflow: auto;
      overflow-x: hidden;
   }
</style>
</head>
<body>
   <%
      String memberID = (String) session.getAttribute("memberID");

      List<Composition> orderList = new ArrayList<>();
      
      CompositionDAO compositionDAO = new CompositionDAO();

      orderList = compositionDAO.getOrderList(memberID);
                                    
      int count=0;
      
      if(orderList.size()==0) {
         %>   
         <div id="emptyBox" style="margin-top:50px">
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
                        <table id="order_table" style="text-align:center">
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
</body>
</html>