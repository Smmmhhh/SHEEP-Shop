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
<title>��(������) : ���θ�������</title>
<link rel="stylesheet" href="dataMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
   <!-- [1] Header �߰� -->
   <jsp:include page="../static/html/adminHeader.jsp" />
   <hr style="border: none; border-top: 1px solid #ccc;">

   <!-- [3] ���� -->
   <div id="main">
      <!-- [3]-1 ���� ���̵� -->
      <div class="mainSide">
         <a href="userMenu.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> ���θ� ���� ������ </a><br>
      </div>
      <!-- [3]-2 ���� ���� -->
      <div class="mainCenter">
         <!-- 1. ��ǰ ���̺� ����Ʈ-->
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
              	  <th>��ǰID</th>
                  <th>��ǰ��</th>
                  <th>����</th>
                  <th>���</th>
                  <th>�Ǹż���</th>
                  <th>�����</th>
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

      <!-- [4] Ǫ��  -->
      <jsp:include page="../static/html/footer.html" />

</body>

</html>