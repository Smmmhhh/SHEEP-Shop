<!--
	annotation Name : memberCheckAction jsp
    User: MHJ
    Date: 2023-08-16
    Time: 오후 5:20
 -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>

<%
	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
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
<title>회원 정보 확인</title>
</head>
<body>

</body>
</html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberPW = "";
	
	if(request.getParameter("memberID")!=null){
		memberID = (String) request.getParameter("memberID");
	}
	if(request.getParameter("memberPW")!=null){
		memberPW = (String) request.getParameter("memberPW");
	}
		
	if(memberID == "" || memberPW == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	
	MemberDAO memberDAO = new MemberDAO();
	boolean result = memberDAO.login(memberID, memberPW);
		
	if(result){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보를 확인했습니다.');");
		script.println("location.href = '../memberFix/memberFix.jsp';");
		script.println("</script>;");
		script.close();
		
		return;
		
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디/비밀번호가 틀렸습니다.');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
%>