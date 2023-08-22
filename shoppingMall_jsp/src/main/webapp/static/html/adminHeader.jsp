<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
    
<%
    HttpSession sess = request.getSession();
   	String adminID = (String) sess.getAttribute("adminID");
   	if(adminID!=null)
      System.out.println(adminID+" 접속중");
%>

<header id="header">
  <div class="logo-container">
    <a href="index.jsp" id="logo">
      <img src="../image/logo.png" alt="로고" height="80px" width="300px">
    </a>
  </div>
  <div class="mypage-section" style=" width: auto">
       <%-- 세션 상태에 따라 버튼 보여주기 --%>
        <% if (adminID != null) { %>
            <a href="../adminLogin/adminLogout.jsp" class="main-button" id="loginButton">로그아웃</a>
        <% } else { %>
            <a href="../adminLogin/adminLogin.jsp" class="main-button" id="loginButton">로그인</a>
        <% } %>
    </div>
</header>