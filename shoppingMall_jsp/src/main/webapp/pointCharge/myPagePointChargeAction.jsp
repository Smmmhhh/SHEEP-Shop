<!-------------------------------
  annotation Name : paymentChargeAction jsp
  User: SMH
  Date: 2023-08-24
  Time: 오후 22:40
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>   
<%@ page import="member.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.io.PrintWriter"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 포인트 충전 action</title>
</head>
<body>
<%
	// 유저 session //
	String memberID = (String) session.getAttribute("memberID");

	if (memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);

	String memberName = "";
	String memberPhoneNo = "";
	String memberAddress = "";
	int memberPoint = 0;

	if (member != null) {

		memberName = member.getMemberName();
		memberPhoneNo = member.getMemberPhoneNo();
		memberAddress = member.getMemberAddress();
		memberPoint = member.getMemberPoint();

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('고객 정보를 가져오는 데 실패하였습니다!');");
		script.println("history.back();");
		script.println("</script>;");
		script.close();
		return;
	}
	%>
	
	<%
	int pointCharge = Integer.MIN_VALUE;
	
	// 충전금액과 받아오기
	if (request.getParameter("money") != null && !request.getParameter("money").isEmpty()) {
		pointCharge = Integer.parseInt(request.getParameter("money"));
		//System.out.println(money);
	}
	
	int afterMoney = pointCharge + memberPoint;
	
	// 충전금액 UPDATE 시켜주기
	int result = memberDAO.updateMemberInfo(memberID, afterMoney);
	if(result == 1){
		PrintWriter script = response.getWriter();
		// 버튼메소드 추가 
		String redirectURL = "../pointCharge/pointCharge.jsp";
		script.println("<script>");
		script.println("alert('포인트가 충전되었습니다!');");
		script.println("location.href = '" + redirectURL + "';");			// 이전 페이지 돌려주기
		script.println("</script>");
		script.close();
	}
	%>
	
	
	
</body>
</html>