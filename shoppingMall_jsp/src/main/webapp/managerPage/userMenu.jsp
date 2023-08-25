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
<title>��(������) : ȸ�� ����</title>
<link rel="stylesheet" href="userMenu.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] Header �߰� -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [3] ���� -->
	<div id="main">
		<!-- [3]-1 ���� ���̵� -->
		<div class="mainSide">
			<a href="userMenu.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> ȸ�� ����Ʈ </a><br>
		</div>
		<!-- [3]-2 ���� ���� -->
		<div class="mainCenter">
			<!-- 1. ��ǰ ���̺� ����Ʈ-->
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
						<th>����</th>
						<th>ID</th>
						<th>�̸�</th>
						<th>��ȭ��ȣ</th>
						<th>�ּ�</th>
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
					// ���õ� ���� ��ư�� �� ��������
					String selectedMemberValue = request.getParameter("selectedMember");
					// ���õ� ���� ��ư�� ������ isRadioSelected ���� true�� ����
					if (selectedMemberValue != null && !selectedMemberValue.isEmpty()) {
						isRadioSelected = true;
					}
				%>
				<div class="second_wrap">
				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;" id="deleteButton"
					<%if (!isRadioSelected) {%> disabled <%}%>>�����ϱ�</button>
				</div>
				</div>
			</form>

		</div>
		</div>

		<!-- [4] Ǫ��  -->
		<jsp:include page="../static/html/footer.html" />


		<!-- ��ũ��Ʈ -->
		<script>
			// ���� ��ư ���� �� �����ϱ� ��ư Ȱ��ȭ
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