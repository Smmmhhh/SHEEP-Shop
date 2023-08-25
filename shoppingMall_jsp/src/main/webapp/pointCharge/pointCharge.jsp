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
<link rel="stylesheet" href="../myPage/myPage.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] header -->
	<jsp:include page="../static/html/header.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<div class="secondWrap">
		<div class="wrap">
			<!-- [2] 나의 정보(my info) -->
			<div class="myInfoBar">
				<div class="myInfoBox">
					<h3>My 정보</h3>
				</div>
				<div class="pointMan">
					<h3>포인트 관리</h3>
				</div>
			</div>
			<jsp:include page="../static/html/myPageMenu.html" />

			<!-- [4] 메인(point_bar)-->
			<div class="pointBar">
				<div class="getPoint">
					<h3>보유 포인트</h3>
				</div>
				<div class="viewPoint">
					<h3>0000</h3>
				</div>
				<!-- 알림창을 띄우는 버튼 -->
				<div class="buttonWrap">
					<button id="pointChargeButton">충전하기</button>
				</div>
				<!-- 커스텀 알림창 모달 -->
				<div id="pointChargeModal" class="modal">
					<div id="wrapModal">
						<div class="modalContent">
							<span id="closeButton">&times;</span>
							<!-- 모달 창 닫기(X) 버튼 -->
							<h2>포인트 충전</h2>
							<div class="lineModal">
								<hr>
							</div>
							<form class="fromSubmit" action="pointCharge.jsp" method="post">
								<div>
								<h3>충전금액을 입력해 주세요.</h3>
								<input type="text" name="money" placeholder="입력">
								<div class="lineModal">
									<hr>
								</div>
								<h3>결제카드</h3>
								<p>**카드&nbsp;&nbsp;&nbsp;0000-0000-0000-0000</p>
								</div>
								<div class="buttonWrap">
								<input type="submit" name="charge" value="충전하기" id="finishButton">
								</div>
							</form>
						</div>
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
		var customAlertButton = document.getElementById("pointChargeButton");
		var customAlertModal = document.getElementById("pointChargeModal");
		var customAlertSubmitButton = document.querySelector("#finishButton");
		var customAlertCloseButton = document.querySelector("#closeButton");

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