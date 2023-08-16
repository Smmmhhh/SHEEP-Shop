<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%

request.setCharacterEncoding("UTF-8");
String prodName = null;
int prodPrice = 0;
int prodStock = 0;
String prodDetail = null;
String prodSize = null;
String prodOrigin = null;
String prodDate = null;

if (request.getParameter("prodName") != null) {
	prodName = (String) request.getParameter("prodName");
}
if (request.getParameter("prodPrice") != null) {
	prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
	
}
if (request.getParameter("prodStock") != null) {
	prodStock = Integer.parseInt(request.getParameter("prodStock"));
}
if (request.getParameter("prodSize") != null) {
	prodSize = (String) request.getParameter("prodSize");
}
if (request.getParameter("prodOrigin") != null) {
	prodOrigin = (String) request.getParameter("prodOrigin");
}
if (request.getParameter("prodDate") != null) {
	prodDate = (String) request.getParameter("prodDate");
}


if (prodName == null || prodPrice > 0 || prodStock > 0 || prodSize == null || prodOrigin == null
		|| prodDate == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.');");
	script.println("history.back();");
	script.println("</script>;");
	script.close();
	return;
}

/*
ProductDAO productDAO = new ProductDAO();
int result = productDAO.prodInsert(prodName, prodPrice, prodStock, 
		prodDetail, prodSize, prodOrigin);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'joinMemberComp.jsp';");
	script.println("</script>;");
	script.close();

	return;
} else {
	out.println("</script>; asdasdsad");
}*/
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