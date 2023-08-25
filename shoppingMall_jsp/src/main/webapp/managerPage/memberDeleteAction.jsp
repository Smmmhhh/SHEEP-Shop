<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");

String memberID = "";
String memberPW = "";

if (request.getParameter("selectedMember") != "") {
	memberID = request.getParameter("selectedMember");
}


// normal Case 시퀀스 진행
MemberDAO memberDAO = new MemberDAO();

int result = memberDAO.deleteMember(memberID);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원삭제가 완료되었습니다.');");
	script.println("location.href = 'userMenu.jsp';");
	script.println("</script>");
	script.close();

	return;
} else {
	out.println("실패 result = " + result);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 상품삭제</title>
</head>
<body>

</body>
</html>