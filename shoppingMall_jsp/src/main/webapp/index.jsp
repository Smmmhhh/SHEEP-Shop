<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : main</title>
<link rel="stylesheet" href="index.css">
</head>

<body>
	<jsp:include page="/static/html/header.jsp" />
	<jsp:include page="/static/html/nav.jsp" />
	<jsp:include page="/static/html/article.html" />
	<jsp:include page="/static/html/footer.html" />
</body>

<script>
  // 다른 JSP 페이지로 리디렉션
  window.location.href = 'shop_main/main.jsp'; // 원하는 JSP 파일의 경로를 설정
</script>
</html>