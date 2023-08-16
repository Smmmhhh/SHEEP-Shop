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
<title>쉼 : Login</title>
</head>
<body>

</body>
</html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = "";
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
		HttpSession sess = request.getSession(false);
		sess.setAttribute("memberID", memberID);
				
		Date currentDate = new Date();
		System.out.println(memberID+"님이 로그인했습니다.["+currentDate+"]");
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../shop_main/main.jsp';");
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