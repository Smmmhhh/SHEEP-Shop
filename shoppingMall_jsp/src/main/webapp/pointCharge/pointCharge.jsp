<!-------------------------------
  annotation Name : pointCharge jsp
  User: KJS
  Date: 2023-08-16
  Time: 오후 3:00
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="member.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>



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
	<%
	// 유저 session //
	String memberID = (String) session.getAttribute("memberID");

	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);

	String memberName = "";
	String memberPhoneNo = "";
	String memberAddress = "";
	int memberPoint = 0;

	if (member != null) {

		memberName = member.getMemberName();
		memberPhoneNo = member.getMemberPhoneNo();
		memberAddress = member.getMemberAddress();
		memberPoint = member.getMemberPoint();

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('고객 정보를 가져오는 데 실패하였습니다!');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	%>

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
					<h3><%=new DecimalFormat().format(memberPoint)%></h3>
				</div>

				<!-- 알림창을 띄우는 버튼 -->
				<div class="buttonWrap">
					<button id="pointChargeButton">충전하기</button>

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
								<form action="myPagePointChargeAction.jsp" class="fromSubmit"
									method="post">
									<div>
										<h3>충전금액을 입력해 주세요.</h3>
										<input type="text" name="money" placeholder="입력"
											pattern="^\d+$" title="숫자만 입력해주세요." required>
										<div class="lineModal">
											<hr>
										</div>
										<!-- 카드번호 정규식 추가해야함 -->
										<h3>결제카드</h3>
										<input type="text" name="paymentCard"
											placeholder="카드번호를 입력하세요." style="width: 300px"
											pattern="^\d{4}-\d{4}-\d{4}-\d{4}$"
											title="0000-0000-0000-0000 형식으로 입력해주세요." style="width: 300px"
											required>
									</div>
									<div class="buttonWrap">
										<input type="submit" name="charge" value="충전하기"
											id="finishButton">
									</div>
								</form>
							</div>
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
		var customAlertCloseButton = document.querySelector("#closeButton");
		const finishButton = document.getElementById('finishButton');

		// "Show Custom Alert" 버튼을 클릭하면 모달 알림창을 보이도록 이벤트 리스너 추가
		customAlertButton.addEventListener("click", function() {
			customAlertModal.style.display = "block"; // 모달 보이기
		});

		// "OK" 버튼을 클릭하면 모달 알림창을 숨기도록 이벤트 리스너 추가
		finishButton.addEventListener("click", function() {
		    customAlertModal.style.display = "none"; // 모달 숨기기
		});
		
		// 모달 창의 닫기(X) 버튼을 클릭하면 모달 알림창을 숨기도록 이벤트 리스너 추가
		customAlertCloseButton.addEventListener("click", function() {
			customAlertModal.style.display = "none"; // 모달 숨기기
		});
	</script>
</body>

</html>