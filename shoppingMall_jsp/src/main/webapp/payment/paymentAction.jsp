<!--   
  annotation Name : paymentAction jsp
  User: MHJ
  Date: 2023-08-17
  Time: 오후 3:06
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paymentAction</title>
</head>
<body>

</body>
</html>
<%
	//결제 Action
	
	String memberID = (String) session.getAttribute("memberID");

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);
		
	if(member!=null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'paymentView.jsp';");
		script.println("</script>;");
		script.close();
		
		return;
		
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('고객 정보를 가져오는 데 실패하였습니다!');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
%>