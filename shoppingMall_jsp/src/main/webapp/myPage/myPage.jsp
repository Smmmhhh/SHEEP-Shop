<!--   
  annotation Name : MyPage jsp
  User: KJS
  Date: 2023-08-14
  Time: 오후 2:15
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>쉼 : Mypage</title>
    <link rel="stylesheet" href="myPage.css">
    <link rel="stylesheet" href="../index.css">
    <script src="/static/js/includeHTML.js"></script>
    
</head>

<body>
	<script>
	 // 백엔드에서 가져온 데이터를 시뮬레이션한 배열
	 var productsData = [
	    { name: '상품1', price: 10000, quantity: 2, image: 'image/logo.png' },
	    { name: '상품2', price: 20000, quantity: 3, image: 'image/coffee_image_1.jpg' },
	    { name: '상품2', price: 20000, quantity: 3, image: 'image/coffee_image_1.jpg' }
	];

	// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
	function renderProducts(products) {
	    var buyTable = document.querySelector('#buyInfoTable');
	    var tableContent = '';

	    for (var i = 0; i < products.length; i++) {
	        var product = products[i];
	        tableContent += `
	            <tr>
	                <th>
	             <div class="buydate">구매일자</div> <hr>
	             <img src="${product.image}" alt="${product.name}">
	          </th>
	                <td>
	                    <div><strong>제품명:</strong> ${product.name} </div>
	                    <div><strong>가격:</strong> ${product.price}원</div>
	                </td>
	                <th>반품신청</th>
	            </tr>`;
	    }

	    buyTable.innerHTML = tableContent;
	}

	// 화면이 로드되었을 때 실행
	window.addEventListener('DOMContentLoaded', function() {
	    renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
	});
	</script>

	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.html"/>
	<hr style="border: none; border-top: 1px solid #ccc;">

    <!-- [2] nav 추가 -->
    <jsp:include page="/static/html/nav.html"/>
    <hr style="border: none; border-top: 1px solid #ccc;">
	
	<!-- [3] 나의 정보(my info) -->
    <div class="myinfo_bar">
        <div class="myinfo_box">
            <h3>My 정보</h3>
        </div>
        <div class="mypoint">
        <h3>&nbsp&nbsp&nbsp보유 포인트</h3>
        </div>
    </div>
    
    <!-- [4] mypage box div -->
	<div class="my_box">
        <div class="myshop">
		    <h2>My 쇼핑</h2>
            <h3>주문목록 조회</h3>
            <h3>반품 조회</h3>
        </div>
        <div class="myact">
            <h2>My 활동</h2>
            <h3>장바구니</h3>
            <h3>1:1 문의하기</h3>
        </div>
        <div class="myinfo">
            <h2>My 정보</h2>
            <h3>개인정보 수정</h3>
            <h3>포인트 충전하기</h3>
        </div>
    </div>
    
    <!-- [5] 메인(order_box div-->
	<div class="order_box">
	
         <!-- [5]-1 order_search -->
        <h3>주문 목록</h3>
        <div class="order_search">
            <input type="text" class="ordersearch-input" placeholder="주문한 상품을 검색하세요." required>
            <button type="submit" class="ordesearch-button">▼</button>
        </div>
        
        <!-- [5]-2 order_list-->
        <div class="order_list">
            <div class="table">
                <div class="InfoTitle">
                <table class="InfoTable" id="buyInfoTable">
                <!-- 동적으로 생성된 행이 여기에 추가될 것입니다. -->
                </table>
                </div>
            </div>
        </div>
    </div>

	 <!-- [6] 푸터  -->
     <footer include-html="/static/html/footer.html"></footer>
</body>

</html>