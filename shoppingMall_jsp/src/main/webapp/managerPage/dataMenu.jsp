<%@page import="composition.CompositionDAO"%>
<%@page import="composition.Composition"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼(관리자) : 쇼핑몰데이터</title>
<link rel="stylesheet" href="dataMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
   <!-- [1] Header 추가 -->
   <jsp:include page="../static/html/adminHeader.jsp" />
   <hr style="border: none; border-top: 1px solid #ccc;">

   <!-- [3] 메인 -->
   <div id="main">
      <!-- [3]-1 메인 사이드 -->
      <div class="mainSide">
         <a href="userMenu.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> 쇼핑몰 매출 데이터 </a><br>
      </div>
      <!-- [3]-2 메인 센터 -->
      <div class="mainCenter">
         <!-- 1. 상품 테이블 리스트-->
         <%
            List<Composition> salesList = new ArrayList<>();
            CompositionDAO compDAO = new CompositionDAO();
            salesList = compDAO.getSalesByproduct();
            System.out.println(salesList.get(0).getSalesByProduct());
         %>
         <form action="memberDeleteAction.jsp" method="post"
            class="form_Member_edit">
            <div class="wrap">
            
            <table class="InfoTable" id="MemberInfoTable">
            
               <tr>
              	  <th>상품ID</th>
                  <th>상품명</th>
                  <th>가격</th>
                  <th>재고</th>
                  <th>판매수량</th>
                  <th>매출액</th>
               </tr>
               <%
               for (int i = 0; i < salesList.size(); i++) {
               %>
               <tr>
                  <td class="idField"><%=salesList.get(i).getProduct().getProdID()%></td>
                  <td class="nameField"><%=salesList.get(i).getProduct().getProdName()%></td>
                  <td class="priceField"><%=new DecimalFormat().format(salesList.get(i).getProduct().getProdPrice())%></td>
                  <td class="stockField"><%=salesList.get(i).getProduct().getProdStock()%></td>
                  <td class="salesField"><%=salesList.get(i).getSalesQuantity()%></td>
                  <td class="salesField"><%=new DecimalFormat().format(salesList.get(i).getSalesByProduct())%></td>
               </tr>
               <%
               }
               %>
            </table>
            </div>
         </form>

      </div>
      </div>

      <!-- [4] 푸터  -->
      <jsp:include page="../static/html/footer.html" />

</body>

</html>