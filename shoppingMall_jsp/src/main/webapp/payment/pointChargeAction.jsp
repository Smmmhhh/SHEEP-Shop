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
	int prodID = Integer.MIN_VALUE;
	int prodQuantity = Integer.MIN_VALUE;
	int pointCharge = Integer.MIN_VALUE;
	String paymentCard = null;
	int buttonMethod = Integer.MIN_VALUE;
	String phoneNo = null;
	String address = null;
	
	// 바로결제 시 상품번호 받아오기
	if (request.getParameter("prodID") != "") {
		prodID = Integer.parseInt(request.getParameter("prodID"));
		//System.out.println(ProdID);
	}
	// 바로 결제 시 상품 수량 받아오기
	if (request.getParameter("prodQuantity") != "") {
		prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
		//System.out.println(prodQuantity); 	
	}
	// 버튼 메소드 받아오기 (0 : 장바구니, 1: 바로결제)
	if (request.getParameter("buttonMethod") != "") {
		buttonMethod = Integer.parseInt(request.getParameter("buttonMethod"));
		//System.out.println(buttonMethod);
	}
	
	// 충전금액과 받아오기
	if (request.getParameter("money") != "") {
		pointCharge = Integer.parseInt(request.getParameter("money"));
		//System.out.println(money);
	}
	// 카드번호 받아오기 
	if (request.getParameter("paymentCard") != ""){
		paymentCard = request.getParameter("paymentCard");
		//System.out.println(paymentCard);
	}
	
	// 휴대폰 번호 받아오기
	if (request.getParameter("phoneNo") != "") {
		phoneNo = request.getParameter("phoneNo");
		//System.out.println(phoneNo);
	}
	// 주소 받아오기
	if (request.getParameter("address") != "") {
		address = request.getParameter("address");
		//System.out.println(address);
	}
	
	int afterMoney = pointCharge + memberPoint;
	
	// 충전금액 UPDATE 시켜주기
	int result = memberDAO.updateMemberInfo(memberID, afterMoney);
	if(result == 1){
		PrintWriter script = response.getWriter();
		// 버튼메소드 추가 
		String redirectURL = "../payment/paymentConfirm.jsp?prodID=" + prodID + "&prodQuantity=" 
		+ prodQuantity + "&buttonMethod=" + buttonMethod +"&phoneNo=" + phoneNo + "&address=" + address;
		script.println("<script>");
		script.println("alert('포인트가 충전되었습니다!');");
		script.println("location.href = '" + redirectURL + "';");			// 이전 페이지 돌려주기
		script.println("</script>");
		script.close();
	}
	%>
	
	
	
</body>
</html>