<!-------------------------------
  annotation Name : paymentAction jsp
  User: SMH
  Date: 2023-08-24
  Time: 오후 22:40
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>   
<%@ page import="member.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.io.PrintWriter"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 포인트 충전 action</title>
</head>
<body>
<%
	// 유저 session //
	String memberID = (String) session.getAttribute("memberID");

	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);

	String memberName = "";
	String memberPhoneNo = "";
	String memberAddress = "";
	int memberPoint = 0;

	if (member != null) {

		memberName = member.getMemberName();
		memberPhoneNo = member.getMemberPhoneNo();
		memberAddress = member.getMemberAddress();
		memberPoint = member.getMemberPoint();

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('고객 정보를 가져오는 데 실패하였습니다!');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	%>
	
	
	
</body>
</html>