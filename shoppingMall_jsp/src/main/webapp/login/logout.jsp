<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션을 종료합니다.
    session.invalidate();

 	System.out.println("로그아웃");
%>

<script type="text/javascript">
	location.href = "../shop_main/main.jsp";
</script>
