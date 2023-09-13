<!-------------------------------
  annotation Name : paymentAction jsp
  User: SMH
  Date: 2023-08-25
  Time: 오후 23:24
 -------------------------------->

<%@page import="composition.Composition"%>
<%@page import="composition.CompositionDAO"%>
<%@page import="java.awt.Composite"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%@ page import="product.*"%>
<%@ page import="cart.*"%>
<%@ page import="order.*"%>
<%@ page import="orderProduct.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 결제Action</title>
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
	%>

	<%
	// 데이터 받아오기
	int prodID = Integer.MIN_VALUE;
	int prodQuantity = Integer.MIN_VALUE;
	int buttonMethod = Integer.MIN_VALUE;
	String phoneNo = null;
	String address = null;
	int totalPrice = Integer.MIN_VALUE;

	// 바로결제 시 상품번호 받아오기
	if (request.getParameter("prodID") != "") {
		prodID = Integer.parseInt(request.getParameter("prodID"));
		//System.out.println(prodID);
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
	// 총 가격 받아오기
	if (request.getParameter("totalPrice") != "") {
		totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		//System.out.println(totalPrice);
	}
	%>
	<!-- 	결제하기 시퀀스 -->
	<!-- 	1. members Table : 결제포인트 차감 -->
	<!-- 	2. product Table : 상품 수량 차감 -->
	<!-- 	3. carts Table : 장바구니에서 선택한 상품들 수량변경(변경 후 수량이 0이면 delete 아니면 update) -->
	<!-- 	4. orders Table : insert -->
	<!-- 	5. orderProduct Table : 상품종류들 insert -->
	<%
	//1. member Table 결제포인트 차감

	// member Table "memberPoint" Update 
	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.selGetUserInfo(memberID);
	// 고객 포인트에서 총 상품 가격차감
	int afterPoint = member.getMemberPoint() - totalPrice;

	int memberTblResult = memberDAO.updateMemberInfo(memberID, afterPoint);

	// member Table "memberPoint" Update Complete
	if (memberTblResult == 1) {
		//System.out.println("포인트 : " + member.getMemberPoint());
	}

	//2. product Table 재고 수정

	// product Table "stock" update
	CompositionDAO compositionDAO = new CompositionDAO();
	List<Composition> compositionList = new ArrayList<>();
	if (buttonMethod == 0) { //장바구니
		compositionList = compositionDAO.getCompositionList(memberID);
	} else { //바로결제
		compositionList.add(compositionDAO.getCompositionList(memberID, prodID));
	}

	// Composition 타입의 list를 product 타입인 객체로 변환시켜준다.
	// cart & product join
	List<Product> productList = new ArrayList<>();
	for (Composition e : compositionList) {

		int prodId = e.getProduct().getProdID();
		int prodCtgID = e.getProduct().getProdCtgID();
		String prodName = e.getProduct().getProdName();
		int prodPrice = e.getProduct().getProdPrice();
		int prodStock = e.getProduct().getProdStock() - e.getCart().getCartQuantity(); //현재 수량에서 빼줘야함
		String prodDetail = e.getProduct().getProdDetail();
		String prodSize = e.getProduct().getProdSize();
		String prodOrigin = e.getProduct().getProdOrigin();
		String prodDate = e.getProduct().getProdDate();

		Product product = new Product(prodId, prodCtgID, prodName, prodPrice, prodStock, prodDetail, prodSize, prodOrigin,
		prodDate, 1);

		productList.add(product);

		// stock change Method
		ProductDAO productDAO = new ProductDAO();
		int productUpdateResult = productDAO.updateProductEdit(productList);

	}

	//3. carts Table delete & update
	List<Cart> cartList = new ArrayList<>();
	if (buttonMethod == 0) { //장바구니
		CartDAO cartDAO = new CartDAO();
		cartDAO.getCartList(memberID);

		cartList = cartDAO.getCartList(memberID);
		int cartDeleteResult = cartDAO.deleteCartProd(cartList);

	} else { //바로결제
		// 선택한 상품 정보 가져오기 
		CartDAO cartDAO = new CartDAO();
		Cart cart = cartDAO.getCartList(memberID, prodID);
		cartList.add(cart);

		// 장바구니 수량에서 구매 수량만큼 차감
		int afterQuantity = cartList.get(0).getCartQuantity() - prodQuantity;
		if(afterQuantity <= 0){	//장바구니 수량이 0이면 삭제
			int cartDeleteResult = cartDAO.deleteCartProd(cartList);
		}else {	//장바구니 수량이 0이 아니면 수량만 변경
			int cartUpdateResult = cartDAO.updateCartProdEdit(afterPoint, memberID, prodID);
		}
	}
	
	// 4. orders Table : insert
	OrderDAO orderDAO = new OrderDAO();
	int orderPK =  orderDAO.insertOrder(memberID, address, phoneNo, totalPrice);
	
	// 5. orderProduct Table : 상품종류들 insert
	OrderProductDAO orderProductDAO = new OrderProductDAO();
	List<OrderProduct> orderProductList = new ArrayList<>();
	int cartInsertResult = -1;
	int directInsertResult = -1;
	// 상품 종류만큼 orderProduct 타입의 리스트에 담아주기
	if(buttonMethod == 0){	//장바구니
		for(Composition e : compositionList){
			int oderProductProdID = e.getCart().getProdID();
			int oderProductQuantity = e.getCart().getCartQuantity();
			
			OrderProduct orderProduct = new OrderProduct(orderPK, oderProductProdID, oderProductQuantity, 1);
			orderProductList.add(orderProduct);
		}
		// orderProduct Table Insert Method 
		cartInsertResult = orderProductDAO.insertOrderProduct(orderProductList);
	}else {	//바로결제
		OrderProduct orderProduct = new OrderProduct(orderPK, prodID, prodQuantity, 1);
		orderProductList.add(orderProduct);
		// orderProduct Table Insert Method 
		directInsertResult = orderProductDAO.insertOrderProduct(orderProductList);
	}
	
	if(cartInsertResult == 1 || directInsertResult == 1){
		PrintWriter script = response.getWriter();
		// 버튼메소드 추가 
		String redirectURL = "../payment/paymentComp.jsp?totalPrice=" + totalPrice + "&address=" 
		+ address + "&afterPoint=" + afterPoint;
		script.println("<script>");
		script.println("location.href = '" + redirectURL + "';");			// 이전 페이지 돌려주기
		script.println("</script>");
		script.close();
	}
	%>













</body>
</html>