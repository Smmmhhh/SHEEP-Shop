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
	String newPhoneNo = "";
	String memberID = (String) session.getAttribute("memberID");
	
	//주소 변수
	String postalCode = "";
	String roadNameAddress = "";
	String addressNumber = "";
	String detailedAddress = "";
	String seeAlso = "";
	
	if(request.getParameter("curPassword")!=null){
		curPassword = (String) request.getParameter("curPassword");
	}
	if(request.getParameter("newPassword")!=null){
		newPassword = (String) request.getParameter("newPassword");
		//System.out.println(newPassword);
	}
	if(request.getParameter("confirmPassword")!=null){
		confirmPassword = (String) request.getParameter("confirmPassword");
		//System.out.println(confirmPassword);
	}

	if(request.getParameter("newPhoneNo")!=null){
		newPhoneNo = (String) request.getParameter("newPhoneNo");
	}
		
	//주소 입력받기
	if(request.getParameter("postalCode")!=""){
		postalCode = (String) request.getParameter("postalCode");
	}
	if(request.getParameter("roadNameAddress")!=""){
		roadNameAddress = (String) request.getParameter("roadNameAddress");
	}
	if(request.getParameter("addressNumber")!=""){
		addressNumber = (String) request.getParameter("addressNumber");
	}
	if(request.getParameter("detailedAddress")!=""){
		detailedAddress = (String) request.getParameter("detailedAddress");
	}
	if(request.getParameter("seeAlso")!=""){
		seeAlso = (String) request.getParameter("seeAlso");
	}
	
	
	if(curPassword == "" || newPassword == "" || confirmPassword == "" || postalCode == "" || newPhoneNo == ""
			|| roadNameAddress == "" || addressNumber == "" || detailedAddress == "" || seeAlso == ""){
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

	String memberAddress = roadNameAddress + addressNumber + detailedAddress + seeAlso + postalCode;
	
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.updateMemberInfo(memberID, newPassword, newPhoneNo, memberAddress);
		
	if(result == 1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보 수정이 완료되었습니다.');");
		script.println("location.href = '../myPage/myPage.jsp';");
		script.println("</script>;");
		script.close();
		
		return;
		
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