<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 쉼 : main </title>
    <link rel="stylesheet" href="main.css">
    <script src="/static/js/includeHTML.js"></script>
</head>

<body>
	<jsp:include page="/static/html/header.html" />
	<jsp:include page="/static/html/nav.html" />
	<jsp:include page="/static/html/article.html" />
	<jsp:include page="/static/html/footer.html" />
    <script>
        includeHTML();
        article();
        nav();
    </script>
</body>
</html>