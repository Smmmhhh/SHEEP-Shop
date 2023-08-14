<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>��(������) : ��ǰ ����</title>
<link rel="stylesheet" href="productEdit.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>

<body>
	<!-- [1] Header �߰� -->
	<jsp:include page="../static/html/header.html" />
	<!-- [2] nav �߰� -->
	<jsp:include page="../static/html/nav.html" />

	<!-- [3] ���� -->
	<div id="main">
		<!-- [3]-1 ���� ���̵� -->
		<div class="mainSide">
			<h1>��ǰ����</h1>
			<a href="" class="managerEdit-item"> ��ǰ��� </a><br> <a href=""
				class="managerEdit-item"> ��ǰ���� </a><br> <a href=""
				class="managerEdit-item"> ��ǰ���� </a><br>
		</div>
		<!-- [3]-2 ���� ���� -->
		<div class="mainCenter">
			<div class="editBox">
				<b> ������ �׸��� �����ϼ��� </b>

				<div class="search-box">
					<select class="prodSelect" style="width: 200px; height: 50px;">
						<option>�����ϼ���!</option>
						<option value="prodName">��ǰ�̸�</option>
						<option value="prodCategory">ī�װ�</option>
						<option value="prodPrice">����</option>
						<option value="prodStock">���</option>
						<option value="prodText">����</option>
						<option value="prodSize">������</option>
						<option value="prodOrigin">������</option>
						<option value="prodDate">��������</option>
					</select>
				</div>
			</div>

			<div class="search-edit" style="width: auto; height: 50px;">
				�����ϼ���!</div>
			<div class="editInputdiv">
				<form class="editInput" action="�Է�" method="post">
					<input name="prodEdit">
					<!-- type�� �ڹٽ�ũ��Ʈ���� �������� -->
				</form>

				<button type="submit" formmethod="post"
					style="height: 100px; width: 100px;">�����ϱ�</button>
			</div>
		</div>
	</div>

	<!-- [4] Ǫ��  -->
	<jsp:include page="../static/html/footer.html" />


	<!-- ��ũ��Ʈ -->
	<script>

        //search-box 
        function showEdit() {
            var selectElement = document.getElementsByClassName("prodSelect")[0];
            var selectedValue = selectElement.value;
            //console.log("���õ� ��: " + selectElement);
            //console.log("���õ� ��: " + selectedValue);

            // search-edit �ؽ�Ʈ ����
            var searchText = document.querySelector(".search-edit");
            //searchText.textContent = selectedValue;
            //console.log("���õ� ��: " + searchText);

            if (selectedValue == "prodName") {
                searchText.textContent = "��ǰ�̸�";
            } else if (selectedValue == "prodCategory") {
                searchText.textContent = "ī�װ�";
            } else if (selectedValue == "prodPrice") {
                searchText.textContent = "����";
            } else if (selectedValue == "prodStock") {
                searchText.textContent = "���";
            } else if (selectedValue == "prodText") {
                searchText.textContent = "����";
            } else if (selectedValue == "prodSize") {
                searchText.textContent = "������";
            } else if (selectedValue == "prodOrigin") {
                searchText.textContent = "������";
            } else {
                searchText.textContent = "��������";
            }
        }

        // select �±��� ���� ����� ������ showEdit �Լ��� ȣ��
        var selectElement = document.getElementsByClassName("prodSelect")[0];
        selectElement.addEventListener("change", showEdit); //showEdit ȣ��
        selectElement.addEventListener("change", inputTypech); //inputTypech ȣ��
        
        //�Է¿� ���� input�±� �Ӽ� ����
        function inputTypech() {
            var inputType = document.getElementsByClassName("editInput");
            var selectElement = document.getElementsByClassName("prodSelect")[0];
            var selectValue = selectElement.value;
            
            if(selectValue == "prodPrice"){
                inputType.inputType = "number";
            }else {
                inputType.inputType = "text";
            }
            console.log(inputType.inputType);
        }

    </script>


</body>

</html>