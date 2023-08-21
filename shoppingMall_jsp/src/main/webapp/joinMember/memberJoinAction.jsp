<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = "";
	String memberPW = "";
	String memberName = "";
	String gender = "";
	String phoneNo = "";
	String memberAddress = "";
	
	if(request.getParameter("memberID")!=""){
		memberID = (String) request.getParameter("memberID");
	}
	if(request.getParameter("memberPW")!=""){
		memberPW = (String) request.getParameter("memberPW");
	}
	if(request.getParameter("memberName")!=""){
		memberName = (String) request.getParameter("memberName");
	}
	if(request.getParameter("gender")!=""){
		gender = (String) request.getParameter("gender");
	}
	if(request.getParameter("phoneNo")!=""){
		phoneNo = (String) request.getParameter("phoneNo");
	}
	if(request.getParameter("memberAddress")!=""){
		memberAddress = (String) request.getParameter("memberAddress");
	}
	if(memberID == "" || memberPW == "" || memberName == "" ||
			gender == "" || phoneNo == "" || memberAddress == "" ){	
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
		script.println("location.href = 'joinMemberComp.jsp';");
		script.println("</script>;");
		script.close();
		
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>

</body>
</html>