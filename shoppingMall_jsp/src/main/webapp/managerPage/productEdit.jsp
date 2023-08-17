<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 제품 수정</title>
<link rel="stylesheet" href="../shop_main/main.css">
<link rel="stylesheet" href="productInsert.css">
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
			<a href="productdelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
		</div>

		<div class="mainCenter">
			<form action="productEditAction.jsp" method="post" class="member">
				<!-- [3] 선택된 상품 가져오기 -->
				<%
				// productEditSelect.jsp 에서 prodId 받아오기
				int prodID = Integer.MIN_VALUE;
			
				if (request.getParameter("selectedProduct") != "") {
					prodID = Integer.parseInt(request.getParameter("selectedProduct"));
				}
				
				// prodId 를 이용해서 상품 이름 가져오기
				ProductDAO productDAO = new ProductDAO();
				String prodName = productDAO.selGetProdInfrom(prodID).getProdName();
				%>
				<!-- 0. 상품id  -->
				<div class="field">
					<div class="field">
						<b>상품ID = <%=prodID%></b> <input type="hidden" value="<%=prodID%>" name="prodID">
					</div>
				</div>

				<!-- 1. 상품이름 -->
				<div class="field">
					<h3><%=prodName%>
						수정하기
					</h3>
					<div class="field">
						<b>상품이름</b> <input type="text" name="prodName">
					</div>
				</div>
				<!-- 2. 카테고리는 select 태그 사용 -->
				<div class="field">
					<div class="category-box">
						<b>카테고리</b><br> <select id="categorySelect"
							class="category-select" name="prodCtgID">
							<option value="1">테이크아웃 용품</option>
							<option value="2">커피/원두</option>
							<option value="3">스무디/에이드/베이스</option>
							<option value="4">시럽/소스/파우더</option>
							<option value="5">우유/휘핑크림/탄산</option>
							<option value="6">커피용품/머신</option>
						</select>
						<!-- 선택된 카테고리 값을 hidden input 필드에 저장 -->
						<input type="hidden" name="selectedCategory" value = 1 id="selectedCategory">
					</div>
					<!-- 2-2 현재 카테고리 번호 input -->
					<input type="hidden" name="currCategory" value=<%=productDAO.selGetProdInfrom(prodID).getProdCtgID()%> >
				</div>

				<!-- 3. 가격 -->
				<div class="field">
					<b>가격</b> <input type="text" name="prodPrice">
				</div>
				<!-- 4. 재고 -->
				<div class="field">
					<b>재고</b> <input type="text" name="prodStock">
				</div>
				>

				<!-- 5. 설명 -->
				<div class="field">
					<b>설명</b> <input type="text" name="prodDetail">
				</div>
				>

				<!-- 6. 사이즈 -->
				<div class="field">
					<b>사이즈</b> <input type="text" name="prodSize">
				</div>
				>

				<!-- 7. 원산지 -->
				<div class="field">
					<b>원산지</b> <input type="text" name="prodOrigin">
				</div>

				<!-- 8. 제조일자 -->
				<div class="field">
					<b>제조일자</b> <input type="text" name="prodDate">
				</div>

				<!-- 가입하기 버튼 -->
				<input type="submit" value="수정하기">
			</form>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

	<script>
	//select한 값 넘겨주기 
    var categorySelect = document.getElementById('categorySelect');
    var selectedCategoryInput = document.getElementById('selectedCategory');


    categorySelect.addEventListener('change', function() {
        selectedCategoryInput.value = categorySelect.value;
        //console.log(selectedCategoryInput.value);
    });
	</script>
</body>
</html>