
<%@page import="product.ProductDAO"%>
<%@page import="product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="composition.Composition"%>
<%@ page import="composition.CompositionDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 장바구니</title>
<link rel="stylesheet" href="cart.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>

	<script>
      function submitForm(action) {
         var form = document.getElementById("myForm");
         form.action = action;
         form.submit();
      }
   </script>
	<%
   String memberID = (String) session.getAttribute("memberID");

   if (memberID == null) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href = '../login/login.jsp';");
      script.println("</script>");
   }
	%>
	
	<%
      List<Product> list = new ArrayList<>();

      ProductDAO productDAO = new ProductDAO();
      list = productDAO.getProductList();
   %>

	<!-- [1] header-->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 페이지정보 -->
	<div class="secondWrap">

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
						<a href="#" target="_blank">반품 조회</a>
					</h3>
				</div>
				<div class="my_act">
					<h2>My 활동</h2>
					<h3>
						<a href="#" target="_blank">장바구니</a>
					</h3>
					<h3>
						<a href="#" target="_blank">1:1 문의하기</a>
					</h3>
				</div>
				<div class="my_info">
					<h2>My 정보</h2>
					<h3>
						<a href="#" target="_blank">개인정보 수정 </a>
					</h3>
					<h3>
						<a href="#" target="_blank">포인트 충전하기 </a>
					</h3>
				</div>
			</div>
			<%
			List<Composition> cartList = new ArrayList<>();

			CompositionDAO compositionDAO = new CompositionDAO();

			cartList = compositionDAO.getCompositionList(memberID);

			for (Composition e : cartList) {
				System.out.println(e.getCart().getCartID());
			}
			%>


			<!-- [4] 메인(cart_list) -->
			<div class="cart_box">

				<div class="catr_list">
					<fieldset>
							<legend>장바구니 목록</legend>

						<form id="myForm" method="post">
							<div class="option_box">
								<div class="all_checkbox">
									<input type="checkbox" class="selectAll">전체 선택
								</div>
							
							<button type="button"
								onclick="submitForm('cartDeleteAction.jsp')" name="deleteCart">삭제하기</button>
							</div>
							<!-- 장바구니 목록 동적 생성 -->

							<div class="cart_table">
								<table>
									<%
									for (int i = 0; i < cartList.size(); i++) {
										int ctgID = cartList.get(i).getProduct().getProdCtgID();
										int prodID = cartList.get(i).getProduct().getProdID();
										int ProdPrice = cartList.get(i).getProduct().getProdPrice();
										int cartQuantity = cartList.get(i).getCart().getCartQuantity();
									%>
									<tr>
										<th><input type="checkbox" name="cartProduct"
											value="<%=prodID%>" class="cartCheckbox" onclick="changeEvent()"></th>
										<td><img src="../image/<%=ctgID%>_<%=prodID%>.jpg"
											alt="상품 이미지" width="100px" height="100px"></td>
										<td>
											<div>상품명</div>
											<div><%=cartList.get(i).getProduct().getProdName()%></div>
										</td>
										<td>
											<div class="cart_quantity">
												<div>수량</div>
												<button class="quantity_button" name="decrement-button">-</button>
												<input type="text" class="quantity_input" name="quantity"
													value="<%=cartQuantity%>">
												<button class="quantity_button" name="increment-button">+</button>
											</div>
											
										</td>
										<td>
											<div class="cart_price">
												<div>가격</div>
												<div> class="priceID" <%=ProdPrice%></div>
											</div>
										</td>
									</tr>
									<%
									}
									%>
								</table>
								<script>
                           // 전체 선택 체크박스 요소 가져오기
                         const selectAllCheckbox = document.querySelector('.selectAll');
                         
                         // 아이템 체크박스들의 NodeList 가져오기
                         const itemCheckboxes = document.querySelectorAll('.cartCheckbox');
                         
                         // 전체 선택 체크박스 클릭 시 이벤트 처리
                         selectAllCheckbox.addEventListener('change', function() {
                             const isChecked = selectAllCheckbox.checked;
                             
                             // 아이템 체크박스들의 상태 변경
                             itemCheckboxes.forEach(function(checkbox) {
                                 checkbox.checked = isChecked;
                             });
                         });
                  </script>
							</div>
							<div class="total">
								<h2>총 상품가격</h2>
								<div id="totalPriceID" class="totalPrice"></div>
						
								<input type="hidden" name="buttonMethod" value="0">
								<div class="buy_submit">
									<button type="button"
										onclick="submitForm('../payment/payment.jsp')" name="buy">구매하기
									</button>
								</div>
							</div>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	<div class="second_wrap">
		<form action="../payment/payment.jsp" method="post">
			<input type="submit" value="버튼">
			<input type="hidden" name="buttonMethod" value="0">
		</form>
	</div>
  
	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

	<script>

	// total 값을 계산하고 업데이트하는 함수
	function updateTotal() {
	    const cartList = <%=cartList%>; // JSP에서 받아온 cartList 값을 사용

	    let total = 0;

	    for (let i = 0; i < cartList.length; i++) {
	        const quantity = parseInt(document.querySelectorAll(".quantity_input")[i].value);
	        const price = parseInt(document.querySelectorAll(".priceID")[i].value);
	        total += quantity * price;
	    }

	    const totalPriceElement = document.getElementById("totalPriceID");
	    totalPriceElement.textContent = total.toLocaleString() + ' 원'; // 상품 가격을 금액 형식으로 표시
	}

	// 수량 변경 버튼들의 NodeList 가져오기
	const quantityButtons = document.querySelectorAll(".quantity_button");

	// 수량 변경 버튼 클릭 시 이벤트 처리
	quantityButtons.forEach(function(button) {
	    button.addEventListener("click", function() {
	        updateTotal(); // 수량이 변경될 때마다 total 값을 업데이트
	    });
	});

	// 페이지 로드 시 초기 total 값 계산 및 업데이트
	window.addEventListener("DOMContentLoaded", function() {
	    updateTotal();
	});


      // [2] 선택된 상품만 삭제하기
      const deleteButton = document.querySelector("#delete"); // 삭제 버튼 요소 가져오기

      deleteButton.addEventListener('click', function(event) {
         event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

         // 선택된 체크박스 확인하여 삭제 처리
         itemCheckboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
               const row = checkbox.closest('tr'); // 선택된 체크박스의 가장 가까운 <tr> 요소 가져오기
               row.remove(); // 해당 행 삭제
            }
         });
      });
   
      // [3] quantity_button 클릭시 수량 변화
      document.addEventListener("DOMContentLoaded",
            function() {
               // 페이지가 로드되면 실행되는 코드

               // quantity_input 요소 가져오기
               const quantityInput = document
                     .getElementById("quantity_input");

               // decrement-button, increment-button 요소 가져오기
               const decrementButton = document
                     .querySelector(".decrement-button");
               const incrementButton = document
                     .querySelector(".increment-button");

               // decrement-button 클릭 시
               decrementButton.addEventListener("click", function() {
                  updateQuantity(-1); // 수량을 -1로 업데이트
               });

               // increment-button 클릭 시
               incrementButton.addEventListener("click", function() {
                  updateQuantity(1); // 수량을 +1로 업데이트
               });

               // quantity_input 입력 시
               quantityInput.addEventListener("input", function() {
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

      // total 값을 계산하고 업데이트하는 함수
      function updateTotal() {
         const cartList =
   <%=cartList%>
      ; // JSP에서 받아온 cartList 값을 사용

         let total = 0;

         for (let i = 0; i < cartList.length; i++) {
            const quantity = parseInt(document
                  .querySelectorAll(".quantity_input")[i].value);
            const price = cartList[i].product.prodPrice;
            total += quantity * price;
         }

         const totalPriceElement = document.getElementById("totalPrice");
      }

      // 수량 변경 버튼들의 NodeList 가져오기
      const quantityButtons = document.querySelectorAll(".quantity_button");

      // 수량 변경 버튼 클릭 시 이벤트 처리
      quantityButtons.forEach(function(button) {
         button.addEventListener("click", function() {
            updateTotal(); // 수량이 변경될 때마다 total 값을 업데이트
         });
      });

      // 페이지 로드 시 초기 total 값 계산 및 업데이트
      window.addEventListener("DOMContentLoaded", function() {
         renderCarts();
         updateTotal();
      });
   </script>

</body>
</html>
