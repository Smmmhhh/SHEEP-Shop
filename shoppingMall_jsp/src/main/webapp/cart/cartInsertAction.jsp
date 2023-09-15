<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
	request.setCharacterEncoding("UTF-8");
	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
%>

<%
	// ProductDetail Page에서 파라미터 받아오기 
	int ProdID = Integer.MIN_VALUE;
	int ProdQuantity = Integer.MIN_VALUE;
	int buttonMethod = -1;	// 0:장바구니, 1:바로결제
	
	
	if(request.getParameter("prodID") != ""){
		ProdID = Integer.parseInt(request.getParameter("prodID"));
		//System.out.println(ProdID);
	}

	if(request.getParameter("prodQuantity") != ""){
		ProdQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
		//System.out.println(ProdQuantity); 	

	}
	
	if(request.getParameter("buttonMethod") != ""){
		buttonMethod = Integer.parseInt(request.getParameter("buttonMethod"));
		//System.out.println(buttonMethod);
	}

	// Abnormal 상황
	//
	// 1. history.back 으로 detail page로 돌아갔을 때 바로 장바구니 담기를 하면 
	// 수량이 1로 넘어온다.
	// 2. 모달창이 먼저 나타나는 현상 
	
	//CartDAO 객체생성
	CartDAO cartDAO = new CartDAO();
	
	// 추가하려는 상품이 기존에 있는 상품이라면 수량 수정해주기
	List<Cart> cartList = new ArrayList<>();
	cartList = cartDAO.getCartList(memberID);
	boolean inspection = false;
	int beforeQuantity = 0;
	int afterQuantity = 0;
	int result = 0;
	// 해당 고객 리스트 검사
	for(int i = 0; i < cartList.size(); i++){
		if(cartList.get(i).getProdID() == ProdID){
			beforeQuantity = cartList.get(i).getCartQuantity();
			inspection = true;
			break;
		}
	}

// 고객 리스트 검사 결과
if(inspection) {
	afterQuantity = beforeQuantity + ProdQuantity;
	result = cartDAO.updateCartProdEdit(afterQuantity, memberID, ProdID);
} else {
	result = cartDAO.cartInsert(memberID, ProdID, ProdQuantity);
}

// 쿼리문 실행결과
String redirectURL = null;

if (result == 1 && buttonMethod == 0){			// 쿼리문 성공 && 장바구니 버튼일 때
	PrintWriter script = response.getWriter();
	script.println("<script>");
	//script.println("alert('장바구니에 추가되었습니다.');");
	script.println("history.back();");			// 이전 페이지 돌려주기
	script.println("</script>");
	script.close();
} else if(result == 1 && buttonMethod == 1){
	redirectURL = "../payment/payment.jsp?prodID=" + ProdID + "&prodQuantity=" + ProdQuantity + "&buttonMethod=" + buttonMethod;
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = '" + redirectURL + "';");
	script.println("</script>");
	script.close();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>