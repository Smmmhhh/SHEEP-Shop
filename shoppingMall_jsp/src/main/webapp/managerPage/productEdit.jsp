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
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.html" />
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

			<!-- 3-1 상품 테이블 -->
			<div class="productListBox">상품 리스트</div>
			<table class="InfoTable" id="prodInfoTable">
				<!-- 동적으로 생성된 행이 여기에 추가될 것입니다. -->
			</table>


			<div class="editBox">
				<b> 수정할 항목을 선택하세요 </b>

				<div class="search-box">
					<select class="prodSelect" style="width: auto; height: 50px;">
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

			<div class="search-edit" style="width: auto; height: 50px;">
				선택하세요!</div>
			<div class="editInputdiv">
				<form class="editInput" action="입력" method="post">
					<input name="prodEdit">
					<!-- type은 자바스크립트에서 지정해줌 -->
				</form>

				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;">수정하기</button>
			</div>
		</div>
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
		//search-box 
		function showEdit() {
			var selectElement = document.getElementsByClassName("prodSelect")[0];
			var selectedValue = selectElement.value;
			var searchText = document.querySelector(".search-edit");

			if (selectedValue == "prodName") {
				searchText.textContent = "상품이름";
			} else if (selectedValue == "prodCategory") {
				searchText.textContent = "카테고리";
			} else if (selectedValue == "prodPrice") {
				searchText.textContent = "가격";
			} else if (selectedValue == "prodStock") {
				searchText.textContent = "재고";
			} else if (selectedValue == "prodText") {
				searchText.textContent = "설명";
			} else if (selectedValue == "prodSize") {
				searchText.textContent = "사이즈";
			} else if (selectedValue == "prodOrigin") {
				searchText.textContent = "원산지";
			} else {
				searchText.textContent = "제조일자";
			}
		}

		// select 태그의 값이 변경될 때마다 showEdit 함수를 호출
		var selectElement = document.getElementsByClassName("prodSelect")[0];
		selectElement.addEventListener("change", showEdit);

		//입력에 따라 input태그 속성 변경
		function inputTypech() {
			var inputType = document.getElementsByClassName("editInput")[0];
			var selectElement = document.getElementsByClassName("prodSelect")[0];
			var selectValue = selectElement.value;

			if (selectValue == "prodPrice") {
				inputType.type = "number";
			} else {
				inputType.type = "text";
			}
			console.log(inputType.type);
		}
// ---------------------------------------------------------------------------------------- // 
// ---------------------------------------------------------------------------------------- // 
// ---------------------------------------------------------------------------------------- // 
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
                    '<button class="selectButton" onclick="selectProductName(\'' + product.name + '\')">선택하기</button>' +
                '</td>' +
            '</tr>';
			}

			prodTable.innerHTML = tableContent;
		}


 		
 	    function selectProductName(productName) {
 	        document.querySelector(".editInput[name='prodEdit']").value = productName;
 	        consile.log(document.querySelector(".editInput[name='prodEdit']").value);
 	    }

 	    
 	    
 	    window.addEventListener('DOMContentLoaded', function() {
 	        renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
 	    });
 	    
 	    

 		
	</script>


</body>

</html>