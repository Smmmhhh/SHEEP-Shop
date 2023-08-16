<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원가입완료</title>
<link rel="stylesheet" href="joinMemberComp.css">
<link rel="stylesheet" href="../shop_main/main.css">
</head>

<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/header.jsp" />
	<!-- [2] nav 추가 -->
	<jsp:include page="../static/html/nav.html" />

	<!-- [3] Main 작성-->
	<main class="main">
		<div class="joinComp">
			<div><h1>축하합니다! 회원가입이 완료되었습니다.</h1></div>
			<div class="wrapButton">
				<button class="custom-button" onclick="redirectToPage('../shop_main/main.jsp')">메인화면</button>
				<button class="custom-button" onclick="redirectToPage('../login/login.jsp')">로그인</button>
			</div>
		</div>
	</main>

	<script>
		function redirectToPage(option) {
		  // 여기에 이동할 페이지의 URL을 입력합니다.
		  var targetPage = option;

		  window.location.href = targetPage;
		}
	</script>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />
</body>
</html>