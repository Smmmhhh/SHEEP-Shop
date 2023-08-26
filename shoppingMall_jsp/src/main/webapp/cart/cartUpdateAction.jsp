<%@page import="java.util.ArrayList"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cart.CartDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
		
	request.setCharacterEncoding("UTF-8");

	String[] quantities = request.getParameterValues("quantity");
	List<Cart> cartList = new ArrayList<>();
	CartDAO cartDAO = new CartDAO();
	cartList = cartDAO.getCartList(memberID);
	
	if(!quantities.equals("")){
		int result=0;
		for(int i=0; i<quantities.length;i++){
			
			int qty = Integer.parseInt(quantities[i]);
			int prodID = cartList.get(i).getProdID();
			
			result = cartDAO.updateCartProdEdit(qty, memberID, prodID);
			
		}	
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../payment/payment.jsp?buttonMethod=0';");
			script.println("</script>;");
			script.close();				
		}
	}
%>
</body>
</html>