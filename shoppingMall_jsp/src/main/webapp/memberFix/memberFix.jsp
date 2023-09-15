<!--
   annotation Name : memberFix jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 6:47
 -->

<%@page import="member.Member"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원정보 수정</title>
<link rel="stylesheet" href="memberFix.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	String curAddress = "";
	String curPhoneNo = "";
	String memberID = (String) session.getAttribute("memberID");

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);
	%>
	<!-- header -->
	<jsp:include page="../static/html/noSearchHeader.html" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<form action="memberFixAction.jsp" method="post">
		<div class="second_wrap">
			<div class="wrap">

				<!-- [2] pageBox -->
				<div class="pagebox">
					<h1>회원정보 수정</h1>
				</div>

				<!-- [3] member_table -->

				<!-- [3]-2 pw 수정 박스-->
				<table class="InfoTable" id="pwTable">
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="curpw">
								<div class="curpw-info">현재 비밀번호</div>
								<input type="password" name="curPassword"
									placeholder="현재 Password 입력">

							</div>
							<div class="chgpw">
								<div class="chgpw-info">변경 비밀번호</div>
								<input type="password" name="newPassword"
									placeholder="새로운 Password 입력"
									pattern="^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$"
									placeholder="대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리"
									title="비밀번호는 대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리로 정의합니다." required>
							</div>
							<div class="chkpw">
								<div class="chkpw-info">변경 비밀번호 확인</div>
								<input type="password" name="confirmPassword"
									placeholder="새로운 Password 입력"
									pattern="^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$"
									placeholder="대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리"
									title="비밀번호는 대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리로 정의합니다." required>
							</div>
						</td>
					</tr>
				</table>

				<!-- [3]-3 add 현재주소 박스-->
				<table class="InfoTable" id="addTable">
					<tr>
						<th>주소</th>
						<td>
							<div class="curadd">
								<div class="curadd-info">현재 주소</div>
								<input type="text" name="curAddress"
									value="<%=member.getMemberAddress()%>" readonly>
							</div>

				<!-- [3]-3 add 수정 박스-->
			
							<div class="chgadd">
							<div class="curadd-info">변경 주소</div>
								<input type="text" id="sample4_postcode" name="postalCode"
									placeholder="우편번호"><br> <input type="button"
									onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
									id="postcode-button"><br> <input type="text"
									id="sample4_roadAddress" name="roadNameAddress"
									placeholder="도로명주소"> <input type="text"
									id="sample4_jibunAddress" name="addressNumber"
									placeholder="지번주소"> <span id="guide"
									style="color: #999; display: none"></span> <input type="text"
									id="sample4_detailAddress" name="detailedAddress"
									placeholder="상세주소"> <input type="text"
									id="sample4_extraAddress" name="seeAlso" placeholder="참고항목">
							</div>
						</td>

					</tr>
				</table>

				<!-- [3]-1 phoneNo 수정 박스-->
				<table class="InfoTable" id="phoneNoTable">
					<tr>
						<th>전화번호</th>
						<td>
							<div class="curphoneNo">
								<div class="curphoneNo-info">현재 전화번호</div>
								<input type="text" name="curPhoneNo"
									value="<%=member.getMemberPhoneNo()%>" readonly>
							</div>
							<div class="chgphoneNo">
								<div class="chgphoneNo-info">변경 전화번호</div>
								<input type="text" name="newPhoneNo"
									pattern="^(\d{3}-\d{3,4}-\d{4}|\d{10})$"
									placeholder="예시 010-0000-0000"
									title="010-0000-0000 형식으로 입력해주세요." required>
							</div>
						</td>
					</tr>
				</table>

				<!-- [4] 확인 -->
				<div class="confirmButton_div">
					<input type="submit" value="확인" id="confirmButton">
				</div>
			</div>
		</div>
	</form>

	<!-- [5] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>

</body>
</html>