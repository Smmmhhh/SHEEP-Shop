<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="productInsertAction.jsp" method="post" class="member">
		<!-- [1] ��ǰ �Է� -->

		<!-- 1. ��ǰ�̸� -->
		<div class="field">
			<b>��ǰ�̸�</b> <span class="placeholder"><input type="text"
				name="prodName"></span>
		</div>
		<!-- 2. ī�װ��� �޺��ڽ��� ���;��� -->
		<div class="field">
			<div class="category-box">
				<b>ī�װ�</b><br> <select id="categorySelect"
					class="category-select">
					<option value="1">��ǰ ī�װ�</option>
					<option value="2">����Ʈ�ƿ� ��ǰ</option>
					<option value="3">Ŀ��/����</option>
					<option value="4">�÷�/�ҽ�/�Ŀ��</option>
					<option value="5">������/���̵�/���̽�</option>
					<option value="6">����/����ũ��/ź��</option>
					<option value="7">Ŀ�ǿ�ǰ/�ӽ�</option>
				</select> <input type="text" id="selectedCategory" readonly>
			</div>

		</div>

		<!-- 3. ���� -->
		<div class="field">
			<b>����</b> <input type="text" name="prodPrice">
		</div>
		<!-- 4. ��� -->
		<div class="field">
			<b>���</b> <input type="text" name="prodStock">
		</div>
		>

		<!-- 5. ���� -->
		<div class="field">
			<b>����</b> <input type="text" name="prodText">
		</div>
		>

		<!-- 6. ������ -->
		<div class="field">
			<b>������</b> <input type="text" name="prodSize">
		</div>
		>

		<!-- 7. ������ -->
		<div class="field">
			<b>������</b> <input type="text" name="prodOrigin">
		</div>

		<!-- 8. �������� -->
		<div class="field">
			<b>��������</b> <input type="text" name="prodDate">
		</div>

		<!-- �����ϱ� ��ư -->
		<input type="submit" value="����ϱ�">

		<!-- [2]. Ǫ�� -->


		<!-- Ǫ�� �߰��ؾ��� -->
	</form>

	<script>
        // ���õ� �׸��� ǥ���� input ��ҿ� select ��� ��������
        var selectedCategoryInput = document.getElementById("selectedCategory");
        var categorySelect = document.getElementsByClassName("category-select")[0];

        // select ����� ���� �̺�Ʈ ������ �߰�
        categorySelect.addEventListener("change", function () {
            // ���õ� �ɼ��� ���� �����ͼ� input ��ҿ� ǥ��
            selectedCategoryInput.value = categorySelect.options[categorySelect.selectedIndex].text;
            console.log(selectedCategoryInput.value);
        });

    </script>


</body>
</html>