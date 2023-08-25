<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 제품 수정</title>
<link rel="stylesheet" href="../shop_main/main.css">
<link rel="stylesheet" href="productEdit.css">
</head>
<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<!-- [3] 메인 -->
	<div id="main">
		<!-- [3]-1 메인 사이드 -->
		<div class="mainSide">
			<a href="productInsert.jsp" class="managerEdit-item"> 상품등록 </a><br>
			<a href="productEditSelect.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> 상품수정 </a><br>
			<a href="productDelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
		</div>

		<div class="mainCenter">
			<form action="productEditAction.jsp" method="post" class="member">
				<!-- [3] 선택된 상품 가져오기 -->
				<%
					// productEditSelect.jsp 에서 prodId 받아오기
					int prodID = Integer.MIN_VALUE;
				
					if (request.getParameter("selectedProduct") != "") {
						prodID = Integer.parseInt(request.getParameter("selectedProduct"));
					}
					
					// prodId 를 이용해서 상품 이름 가져오기
					ProductDAO productDAO = new ProductDAO();
					int prodCtgID = productDAO.selGetProdInfrom(prodID).getProdCtgID();
					String prodName = productDAO.selGetProdInfrom(prodID).getProdName();
					int price = productDAO.selGetProdInfrom(prodID).getProdPrice();
					int stock = productDAO.selGetProdInfrom(prodID).getProdStock();
					String detail = productDAO.selGetProdInfrom(prodID).getProdDetail();
					String prodSize = productDAO.selGetProdInfrom(prodID).getProdSize();
					String origin = productDAO.selGetProdInfrom(prodID).getProdOrigin();
					String prodDate = productDAO.selGetProdInfrom(prodID).getProdDate();
					
					if(prodSize.equals("")){
						prodSize="없음";
					}
					
				%>

				<div class="second_wrap">
      
         <div class="wrap">
   
            <!-- [2] pageBox -->
      
            <table class="InfoTable" id="pwTable">
               <tr>
                  <td>
                  <div class="chgpw">
                        <div class="ctg-info">카테고리</div>
                        <select id="categorySelect" class="category-select" name="prodCtgID">
							<option value="1">테이크아웃 용품</option>
							<option value="2">커피/원두</option>
							<option value="3">스무디/에이드/베이스</option>
							<option value="4">시럽/소스/파우더</option>
							<option value="5">우유/휘핑크림/탄산</option>
							<option value="6">커피용품/머신</option>
						</select>
						<!-- 선택된 카테고리 값을 hidden input 필드에 저장 -->
						<input type="hidden" name="selectedCategory" value=1 id="selectedCategory">
						<input type="hidden" name="currCategory" value=<%=prodCtgID%> >
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">상품명</div>
                         <input type="text" name="curtext" value="<%=prodName%>" readonly>
                        <input type="text" name="curtext" placeholder="상품명 입력">
                     </div>
                     <div class="chkpw">
                        <div class="chkpw-info">가격</div>
                        <input type="text" name="curtext" value="<%=price%>" readonly>
                        <input type="text" name="prodPrice" placeholder="가격 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">재고</div>
                        <input type="text" name="curtext" value="<%=stock%>" readonly>
                        <input type="text" name="cprodStock" placeholder="재고 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">설명</div>
                        <input type="text" name="curtext" value="<%=detail%>" readonly>
                        <input type="text" name="prodDetail" placeholder="설명 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">사이즈</div>
                        <input type="text" name="curtext" value="<%=prodSize%>" readonly>
                        <input type="text" name="prodSize" placeholder="사이즈 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">원산지</div>
                        <input type="text" name="curtext" value="<%=origin%>" readonly>
                        <input type="text" name="prodOrigin" placeholder="원산지 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">제조일자</div>
                        <input type="text" name="curtext" value="<%=prodDate%>" readonly>
                        <input type="text" name="prodDate" placeholder="제조일자 입력">
                     </div>
                  </td>
               </tr>
            </table>
   
            <!-- [4] 확인 -->
            <div class="confirmButton_div">
               <input type="submit" value="확인" id="editButton">
            </div>
         </div>
      </div> 
			</form>
		</div>
	</div>

	<!-- [4] 푸터  -->
	<jsp:include page="../static/html/footer.html" />

	<script>
	//select한 값 넘겨주기 
    var categorySelect = document.getElementById('categorySelect');
    var selectedCategoryInput = document.getElementById('selectedCategory');


    categorySelect.addEventListener('change', function() {
        selectedCategoryInput.value = categorySelect.value;
        //console.log(selectedCategoryInput.value);
    });
	</script>
</body>
</html>