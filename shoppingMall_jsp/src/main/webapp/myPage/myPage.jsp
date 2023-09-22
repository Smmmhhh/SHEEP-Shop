<!--
   annotation Name : myPage jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 6:45
 -->

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.Member"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>


<%
String memberID = (String) session.getAttribute("memberID");
if (memberID == null) {
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
            <%
            MemberDAO memberDAO = new MemberDAO();
            Member member = memberDAO.selGetUserInfo(memberID);
            String userName = member.getMemberName();
            int userPoint = member.getMemberPoint();
            java.text.NumberFormat numberFormat = java.text.NumberFormat.getInstance();
            String formattedUserPoint = numberFormat.format(userPoint);
            %>
            <h3 style="width:100%; text-align:center" id="my_page">마이 페이지</h3>
            <h2 style="width:100%; margin-left: 300px" id="ID_box"><%=userName%> 님</h2>
            <h2 style="width:100%; margin-left: 300px" id="point_box">
               현재 보유하고 계신 포인트는 <%=formattedUserPoint%>P 입니다.</h2>
            <!-- [4]-1 order_list -->
            <h3 style="width:100%; text-align:center" id="orderListTitle">주문 목록</h3>
            <div class="order_div">
               <!-- 동적으로 생성되는 내용을 orderList.jsp 파일로 이동했습니다. -->
               <jsp:include page="../orderListCheck/orderList.jsp" />
            </div>
               <!-- <div class="orderSearch">
                  <input type="text" class="orderSearchInput"
                     placeholder="주문한 상품을 검색하세요." required>
                  <button type="submit" class="orderSearchButton">검색</button>
               </div> -->

            </div>
         </div>
      </div>

      <!-- [6] footer  -->
      <jsp:include page="../static/html/footer.html" />
</body>

</html>