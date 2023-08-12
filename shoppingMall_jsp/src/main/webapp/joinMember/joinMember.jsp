<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 쉼 : 회원가입 </title>
    <link rel="stylesheet" href="joinMember.css">
</head>
<body>
    <form action="memberJoinAction.jsp" method="post" class="member">
        <!-- 1.로고 -->
        <img class="logo" height="100px width=100px" src="../image/logo.png">

        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디</b>
            <span class="placeholder"><input type="text" name="memberID"></span>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" name="memberPW">
        </div>
        <!--  
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password">
        </div>
        -->
        <div class="field">
            <b>이름</b>
            <input type="text" name="memberName">
        </div>


        <!-- 3. 필드(성별)-->
        <div class="field gender">
            <b>성별</b>
            <div>
                <label><input type="radio" name="gender" value="남">남자</label>
                <label><input type="radio" name="gender" value="여">여자</label>
            </div>
        </div>    
            
        <!-- 4. 이메일 전화번호 -->
        <div class="field">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력" name="phoneNo"> 
            </div>
        </div>

        <!-- 5. 주소 -->
        <div class="field">
            <b>주소</b>
            <input type="text" placeholder="주소입력" name="memberAddress">
        </div>

        <!-- 가입하기 버튼 -->
        <input type="submit" value="가입하기">

        <!-- 7. 푸터 -->
        <!-- 푸터 추가해야함 -->
    </form>
</body>
</html>