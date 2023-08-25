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
	
	request.setCharacterEncoding("UTF-8");
	
	int prodID = Integer.MIN_VALUE;
	
	CartDAO cartDAO = new CartDAO();

	String[] products = request.getParameterValues("cartProduct");
	
	System.out.println("개수"+products.length);
	
	if(!products.equals("")){
		for(String product : products){
			prodID = Integer.parseInt(product);
			
			int result = cartDAO.cartProductDelete(memberID, prodID);
			
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'cart.jsp';");
				script.println("</script>;");
				script.close();
				
				return;
			}
		}	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 장바구니 삭제</title>
</head>
<body>


</body>
</html>