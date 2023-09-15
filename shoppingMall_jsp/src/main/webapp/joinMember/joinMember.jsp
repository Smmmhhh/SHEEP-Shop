<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원가입</title>
<link rel="stylesheet" href="joinMember.css">

</head>
<body>
	<form action="memberJoinAction.jsp" method="post" class="member">
		<!-- 1.로고 -->
		<img class="logo" height="100px width=100px" src="../image/logo.png">

		<!-- 2. 필드 -->
		<div class="field">
			<b>아이디</b> <span class="placeholder"> <input type="text"
				name="memberID" pattern="^[a-z]{1}[a-z0-9]{5,10}$"
				placeholder="영문 숫자 조합 6~10자리" title="영문 숫자 6~10자리 조합이어야 합니다."
				required>
			</span>
		</div>
		<div class="field">
			<b>비밀번호</b> <input class="userpw" type="password" name="memberPW"
				pattern="^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$"
				placeholder="대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리"
				title="비밀번호는 대소문자 + 숫자 + 특수문자 조합으로 8 ~ 20자리로 정의합니다." required>
		</div>

		<!--  
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password">
        </div>
        -->
		<div class="field">
			<b>이름</b> <input type="text" name="memberName" pattern="^[ㄱ-ㅎ가-힣]+$"
				placeholder="한글을 입력하세요." title="한글만 입력해주세요." required>
		</div>


		<!-- 3. 필드(성별)-->
		<div class="field gender">
			<b>성별</b>
			<div>
				<label><input type="radio" name="gender" value="남">남자</label>
				<label><input type="radio" name="gender" value="여">여자</label>
			</div>
		</div>

		<!-- 4. 이메일 전화번호 -->
		<div class="field">
			<b>휴대전화</b> <select>
				<option value="">대한민국 +82</option>
			</select>
			<div>
				<input type="tel" placeholder="전화번호 입력" name="phoneNo"
					pattern="^(\d{3}-\d{3,4}-\d{4}|\d{10})$"
					placeholder="예시 010-0000-0000" title="010-0000-0000 형식으로 입력해주세요."
					required>
			</div>
		</div>
		<!-- 5. 주소 -->

		<div class="field">
			<b>주소</b> <input type="text" id="sample4_postcode" name="postalCode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" 
				value="우편번호 찾기" id="postcode-button"><br> 
				
				<input type="text" id="sample4_roadAddress" name="roadNameAddress" placeholder="도로명주소"> 
				<input type="text" id="sample4_jibunAddress" name="addressNumber" placeholder="지번주소"> 
				<span id="guide" style="color: #999; display: none"></span> 
				<input type="text" id="sample4_detailAddress" name="detailedAddress" placeholder="상세주소"> 
				<input type="text" id="sample4_extraAddress" name="seeAlso" placeholder="참고항목">
		</div>
		<hr style="height: 2px; background: #999;">
		<!-- 가입하기 버튼 -->
		<input type="submit" value="가입하기">

		<!-- 7. 푸터 -->
		<!-- 푸터 추가해야함 -->
	</form>

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