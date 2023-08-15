<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="productInsertAction.jsp" method="post" class="member">
		<!-- [1] 상품 입력 -->

		<!-- 1. 상품이름 -->
		<div class="field">
			<b>상품이름</b> <span class="placeholder"><input type="text"
				name="prodName"></span>
		</div>
		<!-- 2. 카테고리는 콤보박스로 나와야함 -->
		<div class="field">
			<div class="category-box">
				<b>카테고리</b><br> <select id="categorySelect"
					class="category-select">
					<option value="1">상품 카테고리</option>
					<option value="2">테이트아웃 용품</option>
					<option value="3">커피/원두</option>
					<option value="4">시럽/소스/파우더</option>
					<option value="5">스무디/에이드/베이스</option>
					<option value="6">우유/휘핑크림/탄산</option>
					<option value="7">커피용품/머신</option>
				</select> <input type="text" id="selectedCategory" readonly>
			</div>

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
			<b>설명</b> <input type="text" name="prodText">
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
		<input type="submit" value="등록하기">

		<!-- [2]. 푸터 -->


		<!-- 푸터 추가해야함 -->
	</form>

	<script>
        // 선택된 항목을 표시할 input 요소와 select 요소 가져오기
        var selectedCategoryInput = document.getElementById("selectedCategory");
        var categorySelect = document.getElementsByClassName("category-select")[0];

        // select 요소의 변경 이벤트 리스너 추가
        categorySelect.addEventListener("change", function () {
            // 선택된 옵션의 값을 가져와서 input 요소에 표시
            selectedCategoryInput.value = categorySelect.options[categorySelect.selectedIndex].text;
            console.log(selectedCategoryInput.value);
        });

    </script>


</body>
</html>