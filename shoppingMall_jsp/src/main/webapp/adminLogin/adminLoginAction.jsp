<!--   
  annotation Name : loginAction jsp
  User: MHJ
  Date: 2023-08-15
  Time: 오후 7:00
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	String adminID = "";
	String adminPW = "";
	
	if(request.getParameter("adminID")!=null){
		adminID = (String) request.getParameter("adminID");
	}
	if(request.getParameter("adminPW")!=null){
		adminPW = (String) request.getParameter("adminPW");
	}
		
	if(adminID == "" || adminPW == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
		
	if(adminID.equals("admin") && adminPW.equals("1234")){
		HttpSession sess = request.getSession(false);
		sess.setAttribute("adminID", adminID);
				
		Date currentDate = new Date();
		System.out.println(adminID+"님이 로그인했습니다.["+currentDate+"]");
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../adminMenu/adminMenu.jsp';");
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