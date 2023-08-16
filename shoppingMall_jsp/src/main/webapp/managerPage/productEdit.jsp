<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <link rel="stylesheet" href="productEdit.css"> -->
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>
	<!-- [1] Header 추가  -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.html" />

	<!-- [3] 메인 -->
	<div id="main">
		<!-- [3]-1 메인 사이드 -->
		<div class="mainSide">
			<h1>상품관리</h1>
			<a href="productInsert.jsp" class="managerEdit-item"> 상품등록 </a><br>
			<a href="productEdit.jsp" class="managerEdit-item"> 상품수정 </a><br>
			<a href="productdelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
		</div>

		<!-- [3]-2 메인 센터 -->
		<div class="mainCenter">

			<!-- 1. 상품 테이블 리스트-->
			<div class="productListBox">상품 리스트</div>
			<table class="InfoTable" id="prodInfoTable">
				<!-- 동적으로 생성된 행이 여기에 추가될 것입니다. -->
			</table>

			<!-- 2. 상품 항목 select -->
			<div class="editBox">
				<b> 수정할 항목을 선택하세요 </b>

				<div class="search-box">
					<select class="prodSelect" style="width: auto; height: auto;">
						<option>선택하세요!</option>
						<option value="prodName">상품이름</option>
						<option value="prodCategory">카테고리</option>
						<option value="prodPrice">가격</option>
						<option value="prodStock">재고</option>
						<option value="prodText">설명</option>
						<option value="prodSize">사이즈</option>
						<option value="prodOrigin">원산지</option>
						<option value="prodDate">제조일자</option>
					</select>
				</div>
			</div>
		</div>

		<!-- 3. 선택된 상품과 상품 항목을 input -->
		<form action="추가해야함" method="post" class="form_product_edit">
			<!-- 1. 상품이름 -->
			<div class="field">
				<b>상품이름</b> <input type="text" name="selectProdName">
			</div>
			<!-- 2. 수정항목 -->
			<div class="field">
				<b>수정항목</b> <input type="text" name="prodItem">
			</div>
			<!-- 3. 수정내용 -->
			<div class="field">
				<b>수정내용</b> <input type="text" name="prodEdit">
			</div>

			<button type="submit" formmethod="post"
				style="height: auto; width: 100px;">수정하기</button>
		</form>

	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

	<%
	List<Product> productList = new ArrayList<>();
	ProductDAO productDAO = new ProductDAO();
	productList = productDAO.getProductList();

	// 	for(Product e : productList){
	// 		System.out.println(e.getProdName() + " " +  e.getProdPrice());
	// 	}
	%>
	<!-- 스크립트 -->
	<script>
// <-------- 상품 리스트를 백엔드에서 오는 코드 -------->
		// 백엔드에서 가져온 데이터를 넘겨주기
 		    var productsData = [
		        <%for (Product product : productList) {%>
		            {
		                name: '<%=product.getProdName()%>',
		                price: '<%=product.getProdPrice()%>'
		            },
		        <%}%>
		    ]; 
			
		// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
		function renderProducts(products) {

			var prodTable = document.querySelector('#prodInfoTable');
			var tableContent = '';

			for (var i = 0; i < products.length; i++) {
				var product = products[i];
	            tableContent += '<tr>' +
                '<td>' + product.name + '</td>' +
                '<td>' + product.price + '</td>' +
                '<td>' + 
                    '<button class="selectButton" onclick="selectProductName(<%= product.name %>)">선택하기</button>' +
                '</td>' +
            '</tr>';
			}
			prodTable.innerHTML = tableContent;
		}


 		
 	    function selectProductName(productName) {
 /* 			console.log(productName);
 			var test = document.querySelector(".editInput[name='prodEdit']");
 			console.log(test);
 			test = productName;
 			console.log(test); */
 			var selectProdNameInput = document.querySelector("input[name='selectProdName']");
 		    selectProdNameInput.value = productName;
//  	        document.querySelector(".editInput[name='prodEdit']").value = productName;
 	        

 	    }
 	    window.addEventListener('DOMContentLoaded', function() {
 	        renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
 	    });
 	    

	</script>


</body>

</html>