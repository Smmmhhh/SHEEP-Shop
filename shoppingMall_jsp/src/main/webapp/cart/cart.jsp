<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 장바구니</title>
<link rel="stylesheet" href="cart.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<%
	String memberID = (String) session.getAttribute("memberID");
	request.getParameter("ProdID");
	request.getParameter("memberID");
	request.getParameter("cartQuantity");

if (memberID == null) {
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("location.href = '../login/login.jsp';");
   script.println("</script>");
   
   List<Product> list = new ArrayList<>();
   
   ProductDAO productDAO = new ProductDAO();
   list = productDAO.getProductList();
   
}

CartDAO cartDAO = new CartDAO();
List<Cart> cartList = cartDAO.getCartList(memberID);

%>

	<div class="second_wrap">
		<div class="wrap">
			<!-- [1] header-->
			<jsp:include page="../static/html/header.jsp" />


			<!-- [2] 페이지정보 -->
			<h2 class="cart_font">장바구니</h2>

			<!-- [3] 페이지 링크박스 -->
			<div class="allbox">
				<div class="my_shop">
					<h2>My 쇼핑</h2>
					<h3>
						<a href="myPage.html" target="_blank">주문목록 조회</a>
					</h3>
					<h3>
						<a href="#" target="_blank">반품 조회 
					</h3>
					</a>
				</div>
				<div class="my_act">
					<h2>My 활동</h2>
					<h3>
						<a href="#" target="_blank">장바구니 
					</h3>
					</a>
					<h3>
						<a href="#" target="_blank">1:1 문의하기 
					</h3>
					</a>
				</div>
				<div class="my_info">
					<h2>My 정보</h2>
					<h3>
						<a href="#" target="_blank">개인정보 수정 
					</h3>
					</a>
					<h3>
						<a href="#" target="_blank">포인트 충전하기 
					</h3>
					</a>
				</div>
			</div>

			<!-- [4] 메인(cart_list) -->
			<div class="cart_box">
				<form action="../payment/payment.jsp" method="post">
					<div class="catr_list">
						<fieldset>
							<div class="option_box">
								<div class="all_checkbox">
									<input type="checkbox" class="selectAll">전체 선택
								</div>
								<button class="delete_button" id="delete">삭제하기</button>
							</div>
							<legend>장바구니 목록</legend>
							<div class="cart_table">
								<table>

								</table>

								<div class="total">
									<h2>총 상품가격</h2>
									<h2 id="totalPrice">0</h2>
								</div>
								<div class="buy_submit">
									<input type="submit" name="buy" value="구매하기">
								</div>
						</fieldset>
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


	<script>
         // [1] 전체 선택하기

         // 전체 선택 버튼 요소 가져오기
        const selectAllCheckbox = document.querySelector('.selectAll');

        // 아이템 체크박스들의 NodeList 가져오기
        const itemCheckboxes = document.querySelectorAll('input[name="cartProduct"]');

        // 전체 선택 버튼 클릭 시 이벤트 처리
        selectAllCheckbox.addEventListener('click', function () {
            const isChecked = selectAllCheckbox.checked;

            // 아이템 체크박스들의 상태 변경
            itemCheckboxes.forEach(function (checkbox) {
                checkbox.checked = isChecked;
            });
        });
        
       
        // [2] 선택된 상품만 삭제하기
        const deleteButton = document.querySelector("#delete"); // 삭제 버튼 요소 가져오기

        deleteButton.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

            // 선택된 체크박스 확인하여 삭제 처리
            itemCheckboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    const row = checkbox.closest('tr'); // 선택된 체크박스의 가장 가까운 <tr> 요소 가져오기
                    row.remove(); // 해당 행 삭제
                }
            });
        });

        // [3] quantity_button 클릭시 수량 변화
        document.addEventListener("DOMContentLoaded", function () {
    // 페이지가 로드되면 실행되는 코드

    // quantity_input 요소 가져오기
    const quantityInput = document.getElementById("quantity_input");
    
    // decrement-button, increment-button 요소 가져오기
    const decrementButton = document.querySelector(".decrement-button");
    const incrementButton = document.querySelector(".increment-button");

    // decrement-button 클릭 시
    decrementButton.addEventListener("click", function () {
        updateQuantity(-1); // 수량을 -1로 업데이트
    });

    // increment-button 클릭 시
    incrementButton.addEventListener("click", function () {
        updateQuantity(1); // 수량을 +1로 업데이트
    });

    // quantity_input 입력 시
    quantityInput.addEventListener("input", function () {
        validateQuantityInput(); // 입력값을 유효성 검사하여 업데이트
    });

    // 수량 업데이트 함수
    function updateQuantity(change) {
        let currentQuantity = parseInt(quantityInput.value); // 현재 수량 가져오기
        currentQuantity += change; // 변경된 값만큼 추가

        if (currentQuantity < 1) {
            currentQuantity = 1; // 최소값보다 작으면 1로 설정
        }

        quantityInput.value = currentQuantity; // 변경된 수량을 입력란에 설정
    }

    // 입력값 유효성 검사 함수
    function validateQuantityInput() {
        let inputValue = quantityInput.value;
        inputValue = inputValue.replace(/\D/g, ''); // 숫자 이외의 문자 제거
        quantityInput.value = inputValue; // 유효성 검사된 값으로 입력란 업데이트
    }
});
        
	// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
	function renderProducts(products){
    	var cartTable = document.querySelector('.cart_table');
   		var tableContent = '';
   		
   		for(var i = 0; i <cartList.size(); i++){
   			var cart = cartList[i];
   			tableContent += '<tr>'
   				+ '<th><input type="checkbox" name="cartProduct" value="cartNo1"></th>'
                + '<td><img src="' + product.image + '" alt="상품 이미지" width="100px" height="100px"></td>'
                + '<td>' + '<div>상품명 ' + product.name + '</div>'
                + '</td>'
                + '<td>'
                + '<div class="cart_quantity">'
                + '<div>수량</div>'
                + '<button class="quantity_button" name="decrement-button">-</button>'
                + '<input type="text" class="quantity_input" name="quantity" value="' + product.quantity + '">'
                + '<button class="quantity_button" name="increment-button">+</button>'
                + '</div>' + '</td>'
                + '<td>'
                + '<div class="cart_price">'
                + '<div>가격</div>'
                + '<div>' + product.price + '</div>'
                + '</div>' + '</td>' + '</tr>';
   		}

   		cartTable.innerHTML = tableContent;
	}

	// 화면이 로드되었을 때 실행
	window.addEventListener('DOMContentLoaded', function() {
		renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
	});

 </script>
</body>
</html>