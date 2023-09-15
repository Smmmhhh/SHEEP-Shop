zfh<!--   
  annotation Name : adminLogout jsp
  User: MHJ
  Date: 2023-08-22
  Time: 오후 10:50
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
    
<%

	String adminID = (String) session.getAttribute("adminID");
	Date currentDate = new Date();
	if(adminID!=null)
		System.out.println(adminID+"님이 로그아웃했습니다.["+currentDate+"]");

	// 세션을 종료합니다.
    session.invalidate();

%>

<script type="text/javascript">
	location.href = "../adminLogin/adminLogin.jsp";
</script>
