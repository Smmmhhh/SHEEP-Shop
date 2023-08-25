<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String adminID = (String) session.getAttribute("adminID");
	if(adminID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../adminLogin/adminLogin.jsp';");
		script.println("</script>");
	}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼(관리자) : 상품 수정</title>
<link rel="stylesheet" href="productEditSelect.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] Header 추가  -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [3] 메인 -->
	<div id="main">
		<!-- [3]-1 메인 사이드 -->
		<div class="mainSide">
			<a href="productInsert.jsp" class="managerEdit-item"> 상품등록 </a><br>
			<a href="productEditSelect.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> 상품수정 </a><br>
			<a href="productDelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
		</div>

		<!-- [3]-2 메인 센터 -->
		<div class="mainCenter">

			<!-- 1. 상품 테이블 리스트-->
<!-- 			<b style="height: 20px">수정할 상품을 선택하세요.</b> -->
			<%
			// 제품 리스트 가져오기
			List<Product> productList = new ArrayList<>();
			ProductDAO productDAO = new ProductDAO();
			productList = productDAO.getProductList();
			%>
			<form action="productEdit.jsp" method="post">
				<div class="second_wrap">
      
         <div class="wrap">
				<table class="InfoTable" id="prodInfoTable">
					
					<tr>
						<th>선택</th>
						<th>상품번호</th>
						<th>상품명</th>
					</tr>
					<%
					for (int i = 0; i < productList.size(); i++) {
					%>
					<tr>
						<td class="radioField"><input type="radio" value="<%=productList.get(i).getProdID()%>" name="selectedProduct"></td>			
						<td class="numField"><%=productList.get(i).getProdID()%></td>							
						<td class="infoField"><%=productList.get(i).getProdName()%></td>		
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
				<div class="second_wrap">
				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;" id="editButton"
					<%if (!isRadioSelected) {%> disabled <%}%>>수정하기</button>
				</div>
				</div>
			</div>
			
			</form>

		</div>
	</div>

		<!-- [4] 푸터  -->
		<jsp:include page="../static/html/footer.html" />

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