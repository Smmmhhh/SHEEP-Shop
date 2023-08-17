<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼(관리자) : 상품 수정</title>
<link rel="stylesheet" href="productDelete.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] 메인 -->
	<div id="main">
		<!-- [3]-1 메인 사이드 -->
		<div class="mainSide">
			<h1>상품관리</h1>
			<a href="productInsert.jsp" class="managerEdit-item"> 상품등록 </a><br>
			<a href="productEditSelect.jsp" class="managerEdit-item"> 상품수정 </a><br>
			<a href="productDelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
		</div>
		<!-- [3]-2 메인 센터 -->
		<div class="mainCenter">
			<!-- 1. 상품 테이블 리스트-->
			<div class="productListBox">상품 리스트</div>
			<br> <b>삭제할 상품을 선택하세요.</b>
			<%
			List<Product> productList = new ArrayList<>();
			ProductDAO productDAO = new ProductDAO();
			productList = productDAO.getProductList();
			%>
			<form action="productDeleteAction.jsp" method="post"
				class="form_product_edit">
				<table class="InfoTable" id="prodInfoTable">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<tr>
						<td>선택</td>
						<td>상품번호</td>
						<td>상품이름</td>
					</tr>
					<%
					for (int i = 0; i < productList.size(); i++) {
					%>
					<tr>
						<td><input type="radio"
							value="<%=productList.get(i).getProdID()%>"
							name="selectedProduct"></td>
						<td><%=productList.get(i).getProdID()%></td>
						<td><%=productList.get(i).getProdName()%></td>
						<td></td>
					</tr>
					<%
					}
					%>
				</table>

				<%
				boolean isRadioSelected = false;
				// 선택된 라디오 버튼의 값 가져오기
				String selectedProductValue = request.getParameter("selectedProduct");
				// 선택된 라디오 버튼이 있으면 isRadioSelected 값을 true로 설정
				if (selectedProductValue != null && !selectedProductValue.isEmpty()) {
					isRadioSelected = true;
				}
				%>
				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;" id="editButton"
					<%if (!isRadioSelected) {%> disabled <%}%>>삭제하기</button>
			</form>

		</div>

		<!-- [4] 푸터  -->
		<jsp:include page="../static/html/footer.html" />


		<!-- 스크립트 -->
		<script>
			// 라디오 버튼 선택 시 수정하기 버튼 활성화
			var radioButtons = document
					.querySelectorAll('input[name="selectedProduct"]');
			var editButton = document.getElementById('editButton');

			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('change', function() {
					editButton.disabled = !radioButton.checked;
				});
			});
		</script>
</body>

</html>