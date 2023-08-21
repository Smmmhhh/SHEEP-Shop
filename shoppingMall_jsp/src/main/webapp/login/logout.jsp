<!--   
  annotation Name : logout jsp
  User: MHJ
  Date: 2023-08-16
  Time: 오전 11:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
    
<%

	String memberID = (String) session.getAttribute("memberID");
	Date currentDate = new Date();
	if(memberID!=null)
		System.out.println(memberID+"님이 로그아웃했습니다.["+currentDate+"]");

	// 세션을 종료합니다.
    session.invalidate();

%>

<script type="text/javascript">
	location.href = "../shop_main/main.jsp";
</script>
