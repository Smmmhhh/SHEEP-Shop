<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>��(������) : ��ǰ ����</title>
<link rel="stylesheet" href="productDelete.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>
	<!-- [1] Header �߰� -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav �߰� -->
	<jsp:include page="../static/html/nav.jsp" />

	<!-- [3] ���� -->
	<div id="main">
		<!-- [3]-1 ���� ���̵� -->
		<div class="mainSide">
			<h1>��ǰ����</h1>
			<a href="productInsert.jsp" class="managerEdit-item"> ��ǰ��� </a><br>
			<a href="productEditSelect.jsp" class="managerEdit-item"> ��ǰ���� </a><br>
			<a href="productDelete.jsp" class="managerEdit-item"> ��ǰ���� </a><br>
		</div>
		<!-- [3]-2 ���� ���� -->
		<div class="mainCenter">
			<!-- 1. ��ǰ ���̺� ����Ʈ-->
			<div class="productListBox">��ǰ ����Ʈ</div>
			<br> <b>������ ��ǰ�� �����ϼ���.</b>
			<%
			List<Product> productList = new ArrayList<>();
			ProductDAO productDAO = new ProductDAO();
			productList = productDAO.getProductList();
			%>
			<form action="productDeleteAction.jsp" method="post"
				class="form_product_edit">
				<table class="InfoTable" id="prodInfoTable">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<tr>
						<td>����</td>
						<td>��ǰ��ȣ</td>
						<td>��ǰ�̸�</td>
					</tr>
					<%
					for (int i = 0; i < productList.size(); i++) {
					%>
					<tr>
						<td><input type="radio"
							value="<%=productList.get(i).getProdID()%>"
							name="selectedProduct"></td>
						<td><%=productList.get(i).getProdID()%></td>
						<td><%=productList.get(i).getProdName()%></td>
						<td></td>
					</tr>
					<%
					}
					%>
				</table>

				<%
				boolean isRadioSelected = false;
				// ���õ� ���� ��ư�� �� ��������
				String selectedProductValue = request.getParameter("selectedProduct");
				// ���õ� ���� ��ư�� ������ isRadioSelected ���� true�� ����
				if (selectedProductValue != null && !selectedProductValue.isEmpty()) {
					isRadioSelected = true;
				}
				%>
				<button type="submit" formmethod="post"
					style="height: auto; width: 100px;" id="editButton"
					<%if (!isRadioSelected) {%> disabled <%}%>>�����ϱ�</button>
			</form>

		</div>

		<!-- [4] Ǫ��  -->
		<jsp:include page="../static/html/footer.html" />


		<!-- ��ũ��Ʈ -->
		<script>
			// ���� ��ư ���� �� �����ϱ� ��ư Ȱ��ȭ
			var radioButtons = document
					.querySelectorAll('input[name="selectedProduct"]');
			var editButton = document.getElementById('editButton');

			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('change', function() {
					editButton.disabled = !radioButton.checked;
				});
			});
		</script>
</body>

</html>