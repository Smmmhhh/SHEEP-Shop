<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");

// productEditSelect.jsp 에서 prodId 받아오기
int prodID = Integer.MIN_VALUE;

if (request.getParameter("selectedProduct") != "") {
	prodID = Integer.parseInt(request.getParameter("selectedProduct"));
}


// normal Case 시퀀스 진행
ProductDAO productDAO = new ProductDAO();
int result = productDAO.updateProductdelete(prodID);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('상품삭제가 완료되었습니다.');");
	script.println("location.href = 'productDelete.jsp';");
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