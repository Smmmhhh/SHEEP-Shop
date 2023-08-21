<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%

	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
%>

<%
	request.setCharacterEncoding("UTF-8");
	int cartProdID = Integer.MIN_VALUE;
	int cartProdQuantity = Integer.MIN_VALUE;
	
	if(request.getParameter("cartProdID") != ""){
		cartProdID = Integer.parseInt(request.getParameter("cartProdID"));
		System.out.println(cartProdID);
	}

	if(request.getParameter("cartProdQuantity") != ""){
		cartProdQuantity = Integer.parseInt(request.getParameter("cartProdQuantity"));
	}
	
	
	CartDAO cartDAO = new CartDAO();
	int result = cartDAO.cartInsert(cartProdID, memberID, cartProdQuantity);
		
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<
</body>
</html>