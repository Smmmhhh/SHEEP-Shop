<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 쉼 : 회원가입완료 </title>
    <link rel="stylesheet" href="joinMemberComp.css">
    <link rel="stylesheet" href="../index.css">
    <script src="../static/js/includeHTML.js"></script>
</head>

<body>
    <!-- [1] Header 추가 -->
     <jsp:include page="../static/html/header.html" />
    <!-- [2] nav 추가 -->
     <jsp:include page="../static/html/nav.html" />

    <!-- [3] Main 작성-->
    <main class="main">
        <div class="joinComp">
            <h1>축하합니다! 회원가입이 완료되었습니다.</h1>
        </div>
    </main>

    <!-- [4] 푸터  -->
     <jsp:include page="../static/html/footer.html" />
    <script>
        includeHTML();
    </script>
</body>
</html>