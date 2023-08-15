<!--
	annotation Name : myPage jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 6:45
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : Mypage</title>
<link rel="stylesheet" href="myPage.css">
<link rel="stylesheet" href="../shop_main/main.css">
<script src="../static/js/includeHTML.js"></script>
</head>

<body>

	 <div>
        <%-- 다른 파일의 table 요소를 추출하여 출력하기 --%>
        <%
            // 파일을 읽어서 원하는 부분을 추출하여 출력
            String content = ""; // 파일 내용을 저장할 변수
            try {
                java.net.URL url = new java.net.URL("../payment/payment.jsp");
                java.net.URLConnection connection = url.openConnection();
                java.io.BufferedReader reader = new java.io.BufferedReader(
                        new java.io.InputStreamReader(connection.getInputStream()));
                boolean startExtraction = false; // 추출을 시작할지 여부를 나타내는 변수
                String inputLine;
                while ((inputLine = reader.readLine()) != null) {
                    if (inputLine.contains("<table")) {
                        startExtraction = true; // 추출 시작
                    }
                    if (startExtraction) {
                        content += inputLine; // 추출한 부분을 content 변수에 추가
                    }
                    if (inputLine.contains("</table>")) {
                        break; // 추출 종료
                    }
                }
                reader.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            // 추출한 부분 출력
            out.print(content);
        %>
    </div>


	<!-- [1] Header -->
	<jsp:include page="../static/html/header.html" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [2] 나의 정보(my info) -->
	<div class="wrap2">
		<div class="wrap">
			<div class="myinfo_bar">
				<div class="myinfo_box">
					<h3>My 정보</h3>
				</div>
				<div class="mypoint">
					<h3>보유 포인트</h3>
				</div>
			</div>
			<!-- [3] mypage box div -->
			<div class="second_wrap">
				<div class="my_box">
					<div class="myshop">
						<h2>My 쇼핑</h2>
						<h3>
							<a href="myPage.html" target="_blank">주문목록 조회</a>
						</h3>
						<h3>
							<a href="#" target="_blank">반품 조회
						</h3>
						</a>
					</div>
					<div class="myact">
						<h2>My 활동</h2>
						<h3>
							<a href="#" target="_blank">장바구니
						</h3>
						</a>
						<h3>
							<a href="#" target="_blank">1:1 문의하기
						</h3>
						</a>
					</div>
					<div class="myinfo">
						<h2>My 정보</h2>
						<h3>
							<a href="#" target="_blank">개인정보 수정
						</h3>
						</a>
						<h3>
							<a href="#" target="_blank">포인트 충전하기
						</h3>
						</a>
					</div>
				</div>
				<!-- [4] 메인(order_box div-->
				<div class="order_box">
					<!-- [4]-1 order_search -->
					<h3>주문 목록</h3>
					<div class="order_search">
						<input type="text" class="ordersearch-input"
							placeholder="주문한 상품을 검색하세요." required>
						<button type="submit" class="ordesearch-button">검색</button>
					</div>
					<!-- [4]-2 order_list-->
				
				</div>
			</div>
		</div>
	</div>

	<!-- [6] footer  -->
	<jsp:include page="../static/html/footer.html" />
	<script>
        includeHTML();
    </script>
</body>

</html>