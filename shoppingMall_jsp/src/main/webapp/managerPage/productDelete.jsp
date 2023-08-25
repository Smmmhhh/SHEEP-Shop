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
</head>

<body>
	<!-- [1] Header �߰� -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [3] ���� -->
	<div id="main">
		<!-- [3]-1 ���� ���̵� -->
		<div class="mainSide">
			<a href="productInsert.jsp" class="managerEdit-item"> ��ǰ��� </a><br>
			<a href="productDelete.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> ��ǰ���� </a><br>
			<a href="productEditSelect.jsp" class="managerEdit-item"> ��ǰ���� </a><br>
		</div>
		<!-- [3]-2 ���� ���� -->
		<div class="mainCenter">
			<!-- 1. ��ǰ ���̺� ����Ʈ-->
			<%
			List<Product> productList = new ArrayList<>();
			ProductDAO productDAO = new ProductDAO();
			productList = productDAO.getProductList();
			%>
			<form action="productDeleteAction.jsp" method="post"
				class="form_product_edit">
				<div class="wrap">
				
				<table class="InfoTable" id="prodInfoTable">
				
					<tr>
						<th>����</th>
						<th>��ǰ��ȣ</th>
						<th>��ǰ��</th>
					</tr>
					<%
					for (int i = 0; i < productList.size(); i++) {
					%>
					<tr>
						<td class="radioField"><input type="radio" value="<%=productList.get(i).getProdID()%>" name="selectedProduct"></td>
						<td class="numField"><%=productList.get(i).getProdID()%></td>
						<td class="infoField"><%=productList.get(i).getProdName()%></td>
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
					.querySelectorAll('input[name="selectedProduct"]');
			var editButton = document.getElementById('deleteButton');

			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('change', function() {
					editButton.disabled = !radioButton.checked;
				});
			});
		</script>
</body>

</html>