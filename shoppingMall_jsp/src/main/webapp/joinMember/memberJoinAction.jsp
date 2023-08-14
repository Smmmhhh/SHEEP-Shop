<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.Member" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = null;
	String memberPW = null;
	String memberName = null;
	String gender = null;
	String phoneNo = null;
	String memberAddress = null;
	
	if(request.getParameter("memberID")!=null){
		memberID = (String) request.getParameter("memberID");
	}
	if(request.getParameter("memberPW")!=null){
		memberPW = (String) request.getParameter("memberPW");
	}
	if(request.getParameter("memberName")!=null){
		memberName = (String) request.getParameter("memberName");
	}
	if(request.getParameter("gender")!=null){
		gender = (String) request.getParameter("gender");
	}
	if(request.getParameter("phoneNo")!=null){
		phoneNo = (String) request.getParameter("phoneNo");
	}
	if(request.getParameter("memberAddress")!=null){
		memberAddress = (String) request.getParameter("memberAddress");
	}
	if(memberID == null || memberPW == null || memberName == null ||
			gender == null || phoneNo == null || memberAddress == null ){	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.join(memberID, memberPW, memberName, gender, phoneNo, memberAddress);
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'joinComp.jsp';");
		script.println("</script>;");
		script.close();
		
		return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>