<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 쉼(관리자) : 상품 수정 </title>
<link rel="stylesheet" href="productEdit.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
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
            <h1> 상품관리 </h1>
			<a href="productInsert.jsp" class="managerEdit-item"> 상품등록 </a><br> 
			<a href="productEdit.jsp" class="managerEdit-item"> 상품수정 </a><br> 
			<a href="productdelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
        </div>
        <!-- [3]-2 메인 센터 -->
        <div class="mainCenter">
            <div class="deleteBox">
                <b> 삭제할 제품을 선택하세요 </b>

                <div class="search-box">
                    <select id="prodSelect">
                        <option value=""> 삭제할 제품을 선택하세요! </option>
                    </select>
                </div>
            </div>

            <button type="submit" formmethod="post" style="height: 100px; width: 100px;"> 삭제하기 </button>
        </div>
    </div>

    <!-- [4] 푸터  -->
    <jsp:include page="../static/html/footer.html" />


    <!-- 스크립트 -->
    <script>
        includeHTML();

        // 백엔드에서 받아온 상품 이름 데이터
        var backendData = ["Option 1", "Option 2", "Option 3", "Option 4"];

        // select id 가져오기
        var selectElement = document.getElementById("prodSelect");

        // 백엔드 데이터 추가
        backendData.forEach(function (item) {
            var option = document.createElement("option");
            option.value = item;
            option.text = item;
            selectElement.appendChild(option);
        });

    </script>


</body>

</html>