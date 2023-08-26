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
			%>

			<!-- [4] 메인(cart_list) -->
			<div class="cart_box">

				<div class="catr_list">
					<fieldset>

						<form id="myForm" method="post">
							<div class="option_box">
								<div class="all_checkbox">
									<input type="checkbox" class="selectAll">전체 선택
								</div>
							</div>
							<button type="button"
								onclick="submitForm('cartDeleteAction.jsp')" name="deleteCart">삭제하기</button>

							<!-- 장바구니 목록 동적 생성 -->

							<legend>장바구니 목록</legend>
							<div class="cart_table">
								<table>
									<%
									for (int i = 0; i < 1; i++) {
										int ctgID = cartList.get(i).getProduct().getProdCtgID();
										int prodID = cartList.get(i).getProduct().getProdID();
										int prodPrice = cartList.get(i).getProduct().getProdPrice();
										int cartQuantity = cartList.get(i).getCart().getCartQuantity();
									%>
									<tr>
										<th><input type="checkbox" name="cartProduct"
											value="<%=prodID%>" class="cartCheckbox"></th>
										<td><img src="../image/<%=ctgID%>_<%=prodID%>.jpg"
											alt="상품 이미지" width="100px" height="100px"></td>
										<td>
											<div>상품명</div>
											<div><%=cartList.get(i).getProduct().getProdName()%></div>
										</td>
										<td>
											<div class="cart_quantity">
												<div class="cart_quantity">
													<div>수량</div>
													<button type=button class="quantity_button"
														name="decrement-button" id="decButton">-</button>
													<input type="text" class="quantity_input" id="quantityInput" name="quantity"
														value="<%=cartQuantity%>">
													<button type=button class="quantity_button"
														name="increment-button" id="incButton">+</button>
												</div>
											</div>
										</td>
										<td>
											<div class="cart_price">
												<div>가격</div>
												<div><%=prodPrice%></div>
											</div>
										</td>
									</tr>
									<%
									}
									%>
								</table>

							</div>
							<div class="total">
								<h2>총 상품가격</h2>
								<div id="totalID" class="totalPrice">

									<script>
                               function updateTotal(){
                                   var cartList = [
                                       <%for (Composition e : cartList) {%>
                                       {
                                           prodPrice: <%=e.getProduct().getProdPrice()%>,
                                           cartQuantity: <%=e.getCart().getCartQuantity()%>
                                       },
                                       <%}%>
                                   ];
                                   
                                   var total = 0;
                                   for (var i = 0; i < cartList.length; i++){
                                       var quantity = cartList[i].cartQuantity;
                                       var price = cartList[i].prodPrice; // 변경: prodPrice 속성 사용
                                       total += quantity * price;
                                   }
                                   
                                   var totalElement = document.getElementById('totalID');
                                   totalElement.textContent = total + "원";
                             }
                               
                               window.addEventListener("DOMContentLoaded", function() {
                                   updateTotal();
                               });
                           </script>
								</div>
							</div>


							<input type="hidden" name="buttonMethod" value="0">
							<div class="buy_submit">
								<button type="button"
									onclick="submitForm('../payment/payment.jsp')" name="buy">구매하기</button>
							</div>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


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
      
      <!-- [3] 버튼 증감 -->
		const quantityInput = document.getElementById("#quantityInput");
        const decrementButton = document.getElementById("#decButton");
        const incrementButton = document.getElementById("#incButton");

              // 감소 버튼 클릭 시
              decrementButton.addEventListener("click", function() {
            	  event.preventDefault(); // 기본 동작 방지
						updateQuantity(-1);
					});

              // 증가 버튼 클릭 시
              incrementButton.addEventListener("click", function() {
            	  event.preventDefault(); // 기본 동작 방지
						updateQuantity(1);
					});

              // 기능 함수 정의
					function updateQuantity(change) {
						const buttonProdQuantity = document
								.getElementById("directProdQuantity");
						const cartProdQuantity = document
								.getElementById("cartButtonProdQuantity");
						let currentQuantity = parseInt(quantityInput.value);
						currentQuantity += change;

						if (currentQuantity < 1) {
							currentQuantity = 1;
						}
						quantityInput.value = currentQuantity;
					}

              function updateTotal() {
                  var cartList = [
                      <%for (Composition e : cartList) {%>
                      {
                          prodPrice: <%=e.getProduct().getProdPrice()%>,
                          cartQuantity: <%=e.getCart().getCartQuantity()%>
                      },
                      <%}%>
                  ];

                  var total = 0;
                  for (var i = 0; i < cartList.length; i++) {
                      var quantity = cartList[i].cartQuantity;
                      var price = cartList[i].prodPrice; // 변경: prodPrice 속성 사용
                      total += quantity * price;
                  }

                  var totalElement = document.getElementById('totalID');
                  totalElement.textContent = total + "원";
              }

              updateTotal(); // 초기 총 상품가격 업데이트 호출
      
 </script>

</body>
</html>