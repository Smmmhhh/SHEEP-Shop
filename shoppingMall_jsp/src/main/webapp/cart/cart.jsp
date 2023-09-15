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

	<%
		String memberID = (String) session.getAttribute("memberID");
	
		if (memberID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../login/login.jsp';");
			script.println("</script>");
		}
	%>
	<script>
      function submitForm(action) {
         var form = document.getElementById("myForm");
         form.action = action;
         form.submit();
      }
   </script>
  
		<!-- [1] Header -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 나의 정보(my info) -->
	<div class="secondWrap">
			<!-- [3] myPage box div -->
			<div class="secondWrap">
			
			<jsp:include page="../static/html/myPageMenu.html" />

			<!-- [2] 페이지정보 -->			
			<%
				List<Composition> cartList = new ArrayList<>();
	
				CompositionDAO compositionDAO = new CompositionDAO();
	
				cartList = compositionDAO.getCompositionList(memberID);
				
				int i=0;
				
				if(cartList.size()==0){
				%>
					<div id="emptyBox">
						장바구니 비어있음
					</div>	
				<%
				}
				else{
			%>

			<!-- [4] 메인(cart_list) -->
			<div class="cart_box">

				<div class="cart_list">
						<form id="myForm" method="post">
<!-- 							<div class="option_box"> -->
<!-- 								<div class="all_checkbox"> -->
<!-- 									<input type="checkbox" class="selectAll">전체 선택 -->
<!-- 								</div> -->
<!-- 								<button type="button" -->
<!-- 								onclick="submitForm('cartDeleteAction.jsp')" name="deleteCart">삭제하기</button> -->
<!-- 							</div> -->

							<!-- 장바구니 목록 동적 생성 -->

							<div class="cartDiv">
								<table id="cartTable">
									<tr style="height:10px">
										<th>
											<input type="checkbox" class="selectAll">
										</th>
										<td style="text-align:left">전체 선택</td>
										<td></td>
										<td></td>
										<td><button type="button" onclick="submitForm('cartDeleteAction.jsp')" name="deleteCart">삭제하기</button></td>
									</tr>
									<tr style="height:20px">
										<th></th>
										<td>이미지</td>
										<td>상품명</td>
										<td>수량</td>
										<td>가격</td>
									</tr>
									<%

										int prodPrice=0;
										for (i = 0; i < cartList.size(); i++) {
											int ctgID = cartList.get(i).getProduct().getProdCtgID();
											int prodID = cartList.get(i).getProduct().getProdID();
											prodPrice = cartList.get(i).getProduct().getProdPrice();
											int cartQuantity = cartList.get(i).getCart().getCartQuantity();

									%>
									<tr id="cartInfo">
										<th><input type="checkbox" name="cartProduct"
											value="<%=prodID%>" class="cartCheckbox" data-price="<%=prodPrice%>"></th>
										<td><img src="../image/<%=ctgID%>_<%=prodID%>.jpg"
											alt="상품 이미지" width="100px" height="100px"></td>
										<td>
											<div style="width: 200px"><%=cartList.get(i).getProduct().getProdName()%></div>
										</td>
										<td>
											<div class="cart_quantity" style="width: 200px">
			                                    <button type="button" onclick="updateQuantity(<%=i%>,-1)" class="quantity_button" id="decrement-button>">-</button>
			                                    <input type="text" id="quantity_input<%=i%>" name="quantity"
			                                       value="<%=cartQuantity%>">
			                                    <button type="button" onclick="updateQuantity(<%=i%>,1)" class="quantity_button" id="increment-button">+</button>
			                                 </div>

										</td>
										<td>
											<div class="cart_price">
												<div><%=prodPrice%></div>
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
                         
                      	// 체크박스 변경 시 총 가격 업데이트
                         itemCheckboxes.forEach(function(checkbox) {
                             checkbox.addEventListener('change', function() {
                                 updateTotal();
                             });
                         });
                  </script>
							</div>
							<div class="total" style="font-size: 24px">
								총 상품가격 :&nbsp;<div id="totalPrice">
									
									<script>
										function updateTotal(){
											 const selectedPrices = []; // 선택된 체크박스의 가격을 저장할 배열
												
											// 전체 선택 체크박스 클릭 시 이벤트 처리
					                         selectAllCheckbox.addEventListener( function(checkbox) {
					                        	 	if (checkbox.checked) {
											            const price = parseFloat(checkbox.getAttribute('data-price')); // 체크된 체크박스의 가격 가져오기
											            selectedPrices.push(price); // 배열에 추가
											        }
					                         });
											 
										    itemCheckboxes.forEach(function(checkbox) {
										        if (checkbox.checked) {
										            const price = parseFloat(checkbox.getAttribute('data-price')); // 체크된 체크박스의 가격 가져오기
										            selectedPrices.push(price); // 배열에 추가
										        }
										    });

										    // 선택된 체크박스의 가격 합계 계산
										    const total = selectedPrices.reduce(function(sum, price) {
										        return sum + price;
										    }, 0);

										    let totalElement = document.getElementById('totalPrice');
										    totalElement.textContent = total + "원";
										}
										
									    function getTotal(){
									        const cartList = [
									            <% for (Composition e : cartList) { %>
									            {
									                prodPrice: <%= e.getProduct().getProdPrice() %>,
									                cartQuantity: <%= e.getCart().getCartQuantity() %>
									            },
									            <% } %>
									        ];
									        
									        let total = 0;
									        for (let i = 0; i < cartList.length; i++){
									            let quantity = cartList[i].cartQuantity;
									            let price = cartList[i].prodPrice; 
									            total += quantity * price;
									        }
									        
									        let totalElement = document.getElementById('totalPrice');
									        totalElement.textContent = total + "원";
									  }
									  
									    window.addEventListener("DOMContentLoaded", function() {
									        getTotal();
									    });
									</script>
								</div>
							</div>
						
							
							<input type="hidden" name="buttonMethod" value="0">
							<div class="buy_submit">
								<button type="button"
									onclick="submitForm('cartUpdateAction.jsp')" name="buy">구매하기</button>
							</div>
						</form>
				</div>
			</div>
			<% 
				}
			%>
		</div>
	</div>

	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


	<script>
	
	    //const deleteButton = document.querySelector("#delete"); // 삭제 버튼 요소 가져오기
	
	    const decrementButton = document.querySelector("#decrement-button"); // 감소 버튼 요소 가져오기
	    const incrementButton = document.querySelector("#increment-button"); // 증가 버튼 요소 가져오기

	    // 삭제 버튼 클릭 시 이벤트 처리
// 	    deleteButton.addEventListener('click', function(event) {
// 	        event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

// 	        // 선택된 체크박스 확인하여 삭제 처리
// 	        itemCheckboxes.forEach(function(checkbox) {
// 	            if (checkbox.checked) {
// 	                const row = checkbox.closest('tr'); // 선택된 체크박스의 가장 가까운 <tr> 요소 가져오기
// 	                row.remove(); // 해당 행 삭제
// 	            }
// 	        });
// 	    });

	    // 감소 버튼 클릭 시 이벤트 처리
	    decrementButton.addEventListener("click", function() {
	        updateQuantity(-1);
	    });

	    // 증가 버튼 클릭 시 이벤트 처리
	    incrementButton.addEventListener("click", function() {
	        updateQuantity(1);
	    });

	    // 수량 입력 필드 입력 시 이벤트 처리
	    quantityInput.addEventListener("input", function() {
	        validateQuantityInput();
	    });

	    // 수량 증가/감소 함수
	    function updateQuantity(index, change) {
	    	 const quantityInput = document.getElementById("quantity_input"+index); // 수량 입력 필드 가져오기
	        let currentQuantity = parseInt(quantityInput.value);
	        currentQuantity += change;

	        if (currentQuantity < 1) {
	            currentQuantity = 1;
	        }

	        quantityInput.value = currentQuantity;
	        validateQuantityInput();
	    }

	    // 수량 입력 필드 유효성 검사
	    function validateQuantityInput() {
	        let inputValue = quantityInput.value;
	        inputValue = inputValue.replace(/\D/g, ''); // 숫자 이외의 문자 제거
	        quantityInput.value = inputValue;
	    }
	</script>

</body>
</html>