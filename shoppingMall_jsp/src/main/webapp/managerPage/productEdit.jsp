<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼(관리자) : 상품 수정</title>
<link rel="stylesheet" href="productEdit.css">
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
			<a href="" class="managerEdit-item"> 상품등록 </a><br> <a href=""
				class="managerEdit-item"> 상품수정 </a><br> <a href=""
				class="managerEdit-item"> 상품삭제 </a><br>
		</div>
		<!-- [3]-2 메인 센터 -->
		<div class="mainCenter">
			<div class="editBox">
				<b> 수정할 항목을 선택하세요 </b>

				<div class="search-box">
					<select class="prodSelect" style="width: 200px; height: 50px;">
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
					style="height: 100px; width: 100px;">수정하기</button>
			</div>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


	<!-- 스크립트 -->
	<script>

        //search-box 
        function showEdit() {
            var selectElement = document.getElementsByClassName("prodSelect")[0];
            var selectedValue = selectElement.value;
            //console.log("선택된 값: " + selectElement);
            //console.log("선택된 값: " + selectedValue);

            // search-edit 텍스트 변경
            var searchText = document.querySelector(".search-edit");
            //searchText.textContent = selectedValue;
            //console.log("선택된 값: " + searchText);

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
        selectElement.addEventListener("change", showEdit); //showEdit 호출
        selectElement.addEventListener("change", inputTypech); //inputTypech 호출
        
        //입력에 따라 input태그 속성 변경
        function inputTypech() {
            var inputType = document.getElementsByClassName("editInput");
            var selectElement = document.getElementsByClassName("prodSelect")[0];
            var selectValue = selectElement.value;
            
            if(selectValue == "prodPrice"){
                inputType.inputType = "number";
            }else {
                inputType.inputType = "text";
            }
            console.log(inputType.inputType);
        }

    </script>


</body>

</html>