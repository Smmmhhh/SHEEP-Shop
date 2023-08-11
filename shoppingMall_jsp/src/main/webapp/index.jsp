<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	JOIN<br><br>
	
	<form action="./memberJoinAction.jsp" method="post">
	
		ID : <input type="text" name="memberID"><br><br>
		
		PW : <input type="password" name="memberPW"><br><br>
		
		Name : <input type="text" name="memberName"><br><br>
		
		Gender : 
		<input type="radio" name="gender" value="남">남&nbsp;
		<input type="radio" name="gender" value="여">여<br><br>
		
		Phone : <input type="text" name="phoneNo"><br><br>
		
		Address : <input type="text" name="memberAddress"><br><br>
		
		<input type="submit" value="회원가입">
	</form>
</body>
</html>