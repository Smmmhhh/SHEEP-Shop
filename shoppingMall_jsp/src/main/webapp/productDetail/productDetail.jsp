<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쉼 : 상품 개별 페이지</title>
    <link rel="stylesheet" href="productDetail.css">
    <link rel="stylesheet" href="../shop_main/main.css">
    <script src="../static/js/includeHTML.js"></script>
</head>

<body>
    <!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.html"/>
    <!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.html"/>

    <!-- [3] 상품 상세 내용 div 생성 -->
    <div id="category">
        <h3>테이크아웃 용품</h3>
    </div>
    <div class="product-details">
        <div>
            <img src="../image/starbucks_mug1.jpg" alt="상품 이미지">
        </div>
        <div class="details">
            <h2>그린 사이렌 도트 머그 355ml</h2>
            <hr style="border: none ; margin: 10px 0 ;border-top:2px solid black">

            <h3 id="productDetail_price">20,000원</h3>

            <h4 id="delivery_fee">└ 배송비 : 무료</h4>

            <div class="quantity">
                <button class="quantity_button" id="decrement-button">-</button>
                <input type="text" id="quantity_input" name="quantity" value="1">
                <button class="quantity_button" id="increment-button">+</button>
            </div>

            <p class="description">법랑 머그의 쉐입을 한 세라믹 머그로서, 트렌디한 감성의 디자인이 결합된 355ml 상품입니다.</p>
        </div>
    </div>

    <!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html"/>
    <script>
        includeHTML();

        document.addEventListener("DOMContentLoaded", function () {
            const quantityInput = document.getElementById("quantity_input");
            const decrementButton = document.querySelector("#decrement-button");
            const incrementButton = document.querySelector("#increment-button");

            decrementButton.addEventListener("click", function () {
                updateQuantity(-1);
            });

            incrementButton.addEventListener("click", function () {
                updateQuantity(1);
            });

            quantityInput.addEventListener("input", function () {
                validateQuantityInput();
            });

            function updateQuantity(change) {
                let currentQuantity = parseInt(quantityInput.value);
                currentQuantity += change;

                if (currentQuantity < 1) {
                    currentQuantity = 1;
                }

                quantityInput.value = currentQuantity;
            }

            function validateQuantityInput() {
                let inputValue = quantityInput.value;
                inputValue = inputValue.replace(/\D/g, ''); // 숫자 이외의 문자 제거
                quantityInput.value = inputValue;
            }
        });

    </script>

</body>
</html>