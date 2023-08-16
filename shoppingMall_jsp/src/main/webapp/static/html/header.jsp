<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
    
<%
    HttpSession sess = request.getSession();
	String memberID = (String) sess.getAttribute("memberID");
	if(memberID!=null)
		System.out.println(memberID+" 접속중");
%>

<header id="header">
    <div class="logo-container">
        <a href="../shop_main/main.jsp" id="logo"> 
        <img src="../image/logo.png" alt="로고" height="65px" width="250px">
        </a>
    </div>
    <div class="search-box">
        <select class="search-select">
            <option value="항목0">상품 카테고리</option>
            <option value="항목1">테이크아웃 용품</option>
            <option value="항목2">커피/원두</option>
            <option value="항목3">시럽/소스/파우더</option>
            <option value="항목4">스무디/에이드/베이스</option>
            <option value="항목5">우유/휘핑크림/탄산</option>
            <option value="항목6">커피용품/머신</option>
        </select> <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <button class="search-button">검색</button>
    </div>
    <div class="mypage-section" style="width: auto">
       <%-- 세션 상태에 따라 버튼 보여주기 --%>
        <% if (memberID != null) { %>
            <a href="../myPage/myPage.jsp" class="main-button" id="myPageButton">마이페이지</a> 
            <span class="my-page"> | </span> 
            <a href="../login/logout.jsp" class="main-button" id="loginButton">로그아웃</a>
        <% } else { %>
        	<a href="../login/login.jsp" class="main-button" id="myPageButton">마이페이지</a> 
            <span class="my-page"> | </span> 
            <a href="../login/login.jsp" class="main-button" id="loginButton">로그인</a>
        <% } %>
    </div>
  
</header>
