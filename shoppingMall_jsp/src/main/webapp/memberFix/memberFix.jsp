<!--
   annotation Name : memberFix jsp
    User: KJS
    Date: 2023-08-15
    Time: 오후 6:47
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쉼 : 회원정보 수정</title>
<link rel="stylesheet" href="memberFix.css">
<link rel="stylesheet" href="../shop_main/main.css">

</head>
<body>

   <!-- header -->
   <jsp:include page="../static/html/adminHeader.html" />
   <hr style="border: none; border-top: 1px solid #ccc;">

   <form action="memberFixAction.jsp" method="post">
      <div class="second_wrap">
         <div class="wrap">
   
            <!-- [2] pageBox -->
            <div class="pagebox">
               <h1>회원정보 수정</h1>
            </div>
   
            <!-- [3] member_table -->
   
            <!-- [3]-2 pw 수정 박스-->
            <table class="InfoTable" id="pwTable">
               <tr>
                  <th>비밀번호</th>
                  <td>
                     <div class="curpw">
                        <div class="curpw-info">현재 비밀번호</div>
                        <input type="password" name="curPassword" placeholder="현재 Password 입력">
                     </div>
                     <div class="chgpw">
                        <div class="chgpw-info">변경 비밀번호</div>
                        <input type="password" name="newPassword" placeholder="새로운 Password 입력">
                     </div>
                     <div class="chkpw">
                        <div class="chkpw-info">변경 비밀번호 확인</div>
                        <input type="password" name="confirmPassword" placeholder="새로운 Password 입력">
                     </div>
                  </td>
               </tr>
            </table>
   
            <!-- [3]-3 add 수정 박스-->
            <table class="InfoTable" id="addTable">
               <tr>
                  <th>주소</th>
                  <td>
                     <div class="curadd">
                        <div class="curadd-info">현재 주소</div>
                        <input type="text" name="curAddress" readonly>
                     </div>
                     <div class="chgadd">
                        <div class="chgadd-info">변경 주소</div>
                        <input type="text" name="newAddress" placeholder="주소 입력">
                     </div>
                  </td>
   
               </tr>
            </table>
            
            <!-- [3]-1 phoneNo 수정 박스-->
            <table class="InfoTable" id="phoneNoTable">
               <tr>
                  <th>전화번호</th>
                  <td>
                     <div class="curphoneNo">
                        <div class="curphoneNo-info">현재 전화번호</div>
                        <input type="text" name="curPhoneNo" readonly>
                     </div>
                     <div class="chgphoneNo">
                        <div class="chgphoneNo-info">변경 전화번호</div>
                        <input type="text" name="newPhoneNo" placeholder="000-0000-0000">
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