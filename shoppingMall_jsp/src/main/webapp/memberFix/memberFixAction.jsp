<!--
	annotation Name : memberCheck jsp
    User: MHJ
    Date: 2023-08-16
    Time: 오후 6:00
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>

<%
	request.setCharacterEncoding("UTF-8");
	String curPassword = "";
	String newPassword = "";
	String confirmPassword = "";
	String newAddress = "";
	String newPhoneNo = "";
	String memberID = (String) session.getAttribute("memberID");
	
	if(request.getParameter("curPassword")!=null){
		curPassword = (String) request.getParameter("curPassword");
	}
	if(request.getParameter("newPassword")!=null){
		newPassword = (String) request.getParameter("newPassword");
	}
	if(request.getParameter("confirmPassword")!=null){
		confirmPassword = (String) request.getParameter("confirmPassword");
	}
	if(request.getParameter("newAddress")!=null){
		newAddress = (String) request.getParameter("newAddress");
	}
	if(request.getParameter("newPhoneNo")!=null){
		newPhoneNo = (String) request.getParameter("newPhoneNo");
	}
		
	if(curPassword == "" || newPassword == "" || confirmPassword == "" || newAddress == "" || newPhoneNo == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	
	if(curPassword.equals(newPassword)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('현재 비밀번호와 변경할 비밀번호를 다르게 설정해주세요.')");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	
	if(!newPassword.equals(confirmPassword)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력하신 비밀번호가 다릅니다.')");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}

	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.updateMemberInfo(memberID, newPassword, newAddress, newPhoneNo);
		
	if(result == 1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보 수정이 완료되었습니다.');");
		script.println("location.href = '../myPage/myPage.jsp';");
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
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 회원 정보 수정</title>
</head>
<body>

</body>
</html>