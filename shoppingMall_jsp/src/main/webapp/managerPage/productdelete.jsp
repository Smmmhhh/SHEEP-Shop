<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> ��(������) : ��ǰ ���� </title>
<link rel="stylesheet" href="productEdit.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
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
            <h1> ��ǰ���� </h1>
			<a href="productInsert.jsp" class="managerEdit-item"> ��ǰ��� </a><br> 
			<a href="productEdit.jsp" class="managerEdit-item"> ��ǰ���� </a><br> 
			<a href="productdelete.jsp" class="managerEdit-item"> ��ǰ���� </a><br>
        </div>
        <!-- [3]-2 ���� ���� -->
        <div class="mainCenter">
            <div class="deleteBox">
                <b> ������ ��ǰ�� �����ϼ��� </b>

                <div class="search-box">
                    <select id="prodSelect">
                        <option value=""> ������ ��ǰ�� �����ϼ���! </option>
                    </select>
                </div>
            </div>

            <button type="submit" formmethod="post" style="height: 100px; width: 100px;"> �����ϱ� </button>
        </div>
    </div>

    <!-- [4] Ǫ��  -->
    <jsp:include page="../static/html/footer.html" />


    <!-- ��ũ��Ʈ -->
    <script>
        includeHTML();

        // �鿣�忡�� �޾ƿ� ��ǰ �̸� ������
        var backendData = ["Option 1", "Option 2", "Option 3", "Option 4"];

        // select id ��������
        var selectElement = document.getElementById("prodSelect");

        // �鿣�� ������ �߰�
        backendData.forEach(function (item) {
            var option = document.createElement("option");
            option.value = item;
            option.text = item;
            selectElement.appendChild(option);
        });

    </script>


</body>

</html>