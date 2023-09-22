<!-------------------------------
  annotation Name : productInsert jsp
  User: SMH
  Date: 2023-08-15
  Time: 오후 5:10
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼(관리자) : 상품 등록</title>
<link rel="stylesheet" href="../shop_main/main.css">
<link rel="stylesheet" href="productInsert.css">
</head>
<body>
	<!-- [1] Header 추가 -->
	<jsp:include page="../static/html/adminHeader.jsp" />
	<hr style="border: none; border-top: 1px solid #ccc;">

	<div class="mainSide">
			<a href="productEditSelect.jsp" class="managerEdit-item"> 상품수정 </a><br>
			<a href="productInsert.jsp" class="managerEdit-item" style="font-size: 30px; color: black"> 상품등록 </a><br>
			<a href="productDelete.jsp" class="managerEdit-item"> 상품삭제 </a><br>
	</div>
   <form action="productInsertAction.jsp" method="post">
      <div class="second_wrap">
      
         <div class="wrap">
   
            <!-- [2] pageBox -->
      
            <table class="InfoTable" id="pwTable">
               <tr>
                  <td>
                     <div class="curpw">
                        <div class="curpw-info">상품명</div>
                        <input type="text" name="prodName" placeholder="상품명 입력" pattern="^[ㄱ-ㅎ가-힣]+$"
								title="한글만 입력해주세요." required>
                     </div>
                     <div class="chgpw">
                        <div class="chgpw-info">카테고리</div>
                        <select id="categorySelect"
							class="category-select" name="prodCtgID">
							<option value="1">테이크아웃 용품</option>
							<option value="2">커피/원두</option>
							<option value="3">스무디/에이드/베이스</option>
							<option value="4">시럽/소스/파우더</option>
							<option value="5">우유/휘핑크림/탄산</option>
							<option value="6">커피용품/머신</option>
						</select>
						<!-- 선택된 카테고리 값을 hidden input 필드에 저장 -->
						<input type="hidden" name="selectedCategory" value=1
							id="selectedCategory">
                     </div>
                     <div class="chkpw">
                        <div class="chkpw-info">가격</div>
                        <input type="text" name="prodPrice" placeholder="가격 입력" pattern="^\d+$"
                        title="숫자만 입력해주세요." required>
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">재고</div>
                        <input type="text" name="prodStock" placeholder="재고 입력" pattern="^\d+$"
                        title="숫자만 입력해주세요." required>
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">설명</div>
                        <input type="text" name="curtext" placeholder="설명 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">사이즈</div>
                        <input type="text" name="curtext" placeholder="사이즈 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">원산지</div>
                        <input type="text" name="curtext" placeholder="원산지 입력">
                     </div>
                     <div class="curpw">
                        <div class="curpw-info">제조일자</div>
                        <input type="text" name="curtext" placeholder="제조일자 입력"
                        pattern="^\d{4}-\d{2}-\d{2}$"
                        title="년-월-일 입력" >
                     </div>
                  </td>
               </tr>
            </table>
   
            <!-- [4] 확인 -->
            <div class="confirmButton_div">
               <input type="submit" value="확인" id="confirmButton">
            </div>
         </div>
      </div>   
   </form>

   <!-- [5] 푸터  -->
   <jsp:include page="../static/html/footer.html" />

</body>
</html>