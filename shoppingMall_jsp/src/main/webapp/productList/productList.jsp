<!-------------------------------
  annotation Name : productList
  User: SMH
  Date: 2023-08-11
  Time: 오후 9:33
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="category.Category"%>
<%@ page import="category.CategoryDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 상품 리스트</title>
<link rel="stylesheet" href="productList.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>
	<%
	//카테고리 ID & 카테고리 이름 가져오기
	int cthID = Integer.parseInt(request.getParameter("cthID"));
	String ctgName = request.getParameter("ctgName");

	// 카테고리 ID & 카테고리 printTest
	// 	System.out.println(cthID);
	// 	System.out.println(ctgName);
	%>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.jsp" />
	<!-- [3] 상품 리스트 div 생성 -->
	<div class="productBox">
		<!-- [3]-1 b태그 카테고리명 & 상품 List 생성 -->
		<div class="prodNavbar">
			<div class="text">
				<b><%=ctgName%></b>
			</div>
			<div class="list">
				<ul id="menu">
					<li><a href="#"><b>낮은 가격순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>높은 가격순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>판매량순 &nbsp; | &nbsp;</b></a></li>
					<li><a href="#"><b>최신순</b></a></li>
				</ul>
			</div>
		</div>
		<!-- [3]-2 ProductList 생성 -->
		<%
		// 현재 카테고리 제품 리스트 가져오기
		List<Product> productList = new ArrayList<>();
		ProductDAO productDAO = new ProductDAO();
		productList = productDAO.selectGetCtgPrud(cthID);
		%>
		<div class="products">

			<%
			// 제품 리스트의 수량만큼 product 생성
			for (int i = 0; i < productList.size(); i++) {
			%>
			<a href="../productDetail/productDetail.jsp?prodID=<%=productList.get(i).getProdID()%>" class="product"> 
			<img src="../image/<%=productList.get(i).getProdCtgID()%>_<%=productList.get(i).getProdID()%>.jpg">
				<div class="product-name"><%=productList.get(i).getProdName()%></div>
				<div class="product-price"><%=new DecimalFormat().format(productList.get(i).getProdPrice())%></div>
			</a>
			<%
			}
			%>

		</div>
	</div>


	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

</body>
</html>