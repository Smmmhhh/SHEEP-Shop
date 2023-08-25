<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼(관리자) : 회원 삭제</title>
<link rel="stylesheet" href="userMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [3] 메인 -->
	<div id="main">
		<!-- [3]-1 메인 사이드 -->
		<div class="mainSide">
			<a href="userMenu.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> 회원 리스트 </a><br>
		</div>
		<!-- [3]-2 메인 센터 -->
		<div class="mainCenter">
			<!-- 1. 상품 테이블 리스트-->
			<%
				List<Member> memberList = new ArrayList<>();
				MemberDAO memberDAO = new MemberDAO();
				memberList = memberDAO.selGetUserList();
			%>
			<form action="memberDeleteAction.jsp" method="post"
				class="form_Member_edit">
				<div class="wrap">
				
				<table class="InfoTable" id="MemberInfoTable">
				
					<tr>
						<th>선택</th>
						<th>ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
					</tr>
					<%
					for (int i = 0; i < memberList.size(); i++) {
					%>
					<tr>
						<td class="radioField"><input type="radio" value="<%=memberList.get(i).getMemberID()%>" name="selectedMember"></td>
						<td class="idField"><%=memberList.get(i).getMemberID()%></td>
						<td class="nameField"><%=memberList.get(i).getMemberName()%></td>
						<td class="phoneField"><%=memberList.get(i).getMemberPhoneNo()%></td>
						<td class="addressField"><%=memberList.get(i).getMemberAddress()%></td>
					</tr>
					<%
					}
					%>
				</table>

				<%
					boolean isRadioSelected = false;
					// 선택된 라디오 버튼의 값 가져오기
					String selectedMemberValue = request.getParameter("selectedMember");
					// 선택된 라디오 버튼이 있으면 isRadioSelected 값을 true로 설정
					if (selectedMemberValue != null && !selectedMemberValue.isEmpty()) {
						isRadioSelected = true;
					}
				%>
				<div class="second_wrap">
				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;" id="deleteButton"
					<%if (!isRadioSelected) {%> disabled <%}%>>삭제하기</button>
				</div>
				</div>
			</form>

		</div>
		</div>

		<!-- [4] 푸터  -->
		<jsp:include page="../static/html/footer.html" />


		<!-- 스크립트 -->
		<script>
			// 라디오 버튼 선택 시 수정하기 버튼 활성화
			var radioButtons = document
					.querySelectorAll('input[name="selectedMember"]');
			var editButton = document.getElementById('deleteButton');

			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('change', function() {
					editButton.disabled = !radioButton.checked;
				});
			});
		</script>
</body>

</html>