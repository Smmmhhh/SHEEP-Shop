
<!-------------------------------
  annotation Name : pointCharge jsp
  User: KJS
  Date: 2023-08-16
  Time: 오후 3:00
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>쉼 : 포인트충전</title>
<link rel="stylesheet" href="pointCharge.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="/static/js/includeHTML.js"></script>

</head>

<body>
	<!-- [1] header -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<div class="second_wrap">
		<div class="wrap">
			<!-- [2] 나의 정보(my info) -->
			<div class="myinfo_bar">
				<div class="myinfo_box">
					<h3>My 정보</h3>
				</div>
				<div class="point_man">
					<h3>포인트 관리</h3>
				</div>
			</div>
			<!-- [3] my_box div -->
			<div class="my_box">
				<div class="myshop">
					<h2>My 쇼핑</h2>
					<h3>
						<a href="myPage.html" target="_blank">주문목록 조회</a>
					</h3>
					<h3>
						<a href="#" target="_blank">반품 조회 
					</h3>
					</a>
				</div>
				<div class="myact">
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
				<div class="myinfo">
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

			<!-- [4] 메인(point_bar)-->
			<div class="point_bar">
				<div class="getpoint">
					<h3>보유 포인트</h3>
				</div>
				<div class="viewpoint">
					<h3>0000</h3>
				</div>
				<!-- 알림창을 띄우는 버튼 -->
				<button id="pointcharge_button">충전하기</button>

				<!-- 커스텀 알림창 모달 -->
				<div id="pointcharge_modal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<!-- 모달 창 닫기(X) 버튼 -->
						<h2>포인트 충전</h2>
						<div class="line_modal">
							<hr>
						</div>
						<form action="pointCharge.jsp" method="post">
							<h3>충전금액을 입력해 주세요.</h3>
							<input type="text" name="money" placeholder="입력">
							<div class="line_modal">
								<hr>
							</div>
							<h3>결제카드</h3>
							<p>**카드&nbsp;&nbsp;&nbsp;0000-0000-0000-0000</p>
							<input type="submit" name="charge" value="충전하기"
								class="finish_button">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- [3] 푸터  -->
	<jsp:include page="../static/html/footer.html" />


	<script>
		// HTML 문서 내 요소들을 JavaScript로 조작하는 부분

		// 버튼과 모달 요소들을 변수에 할당
		var customAlertButton = document.getElementById("pointcharge_button");
		var customAlertModal = document.getElementById("pointcharge_modal");
		var customAlertSubmitButton = document.querySelector(".finish_button");
		var customAlertCloseButton = document.querySelector(".close");

		// "Show Custom Alert" 버튼을 클릭하면 모달 알림창을 보이도록 이벤트 리스너 추가
		customAlertButton.addEventListener("click", function() {
			customAlertModal.style.display = "block"; // 모달 보이기
		});

		// "OK" 버튼을 클릭하면 모달 알림창을 숨기도록 이벤트 리스너 추가
		customAlertSubmitButton.addEventListener("click", function() {
			customAlertModal.style.display = "none"; // 모달 숨기기
		});

		// 모달 창의 닫기(X) 버튼을 클릭하면 모달 알림창을 숨기도록 이벤트 리스너 추가
		customAlertCloseButton.addEventListener("click", function() {
			customAlertModal.style.display = "none"; // 모달 숨기기
		});
	</script>
</body>

</html>