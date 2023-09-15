package composition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cart.Cart;
import order.Order;
import orderProduct.OrderProduct;
import product.Product;
import util.DatabaseUtil;

public class CompositionDAO {
  
	public List<Composition> getCompositionList(String memberID){
		String SQL = "select * from carts C inner join products P on C.prodID = P.prodID "
				+ "where C.memberID = ?" ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Composition> compositionList = new ArrayList<>();
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				int prodID = rs.getInt("prodID");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int prodPrice = rs.getInt("price");
				int prodStock = rs.getInt("stock");
				String prodDetail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
				int prodValidity = rs.getInt("prodValidity");
			
				int cartID = rs.getInt("cartID");
				int cartQuantity = rs.getInt("cartQuantity");

						
				Product product = new Product(prodID, prodCtgID, prodName, prodPrice, prodStock,
						prodDetail, prodSize, prodOrigin, prodDate, prodValidity);
				
				Cart cart = new Cart(cartID, prodID, memberID, cartQuantity); 
				
				Composition composition = new Composition(cart, product);
			
				compositionList.add(composition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Database와 연결 후 반드시 해제시켜주기
			try {
				if (rs != null) {
					rs.close(); // ResultSet을 닫음
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return compositionList;
	}
	
	public Composition getCompositionList(String memberID, int getprodID){
		String SQL = "select * from carts C inner join products P on C.prodID = P.prodID "
				+ "where C.memberID =? and C.prodID = ?" ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Composition composition = null;

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setInt(2, getprodID);
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				int prodID = rs.getInt("prodID");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int prodPrice = rs.getInt("price");
				int prodStock = rs.getInt("stock");
				String prodDetail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
				int prodValidity = rs.getInt("prodValidity");
			
				int cartID = rs.getInt("cartID");
				int cartQuantity = rs.getInt("cartQuantity");

						
				Product product = new Product(prodID, prodCtgID, prodName, prodPrice, prodStock,
						prodDetail, prodSize, prodOrigin, prodDate, prodValidity);
				
				Cart cart = new Cart(cartID, prodID, memberID, cartQuantity); 
				
				composition = new Composition(cart, product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Database와 연결 후 반드시 해제시켜주기
			try {
				if (rs != null) {
					rs.close(); // ResultSet을 닫음
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return composition;
	}
	
	public List<Composition> getOrderList(String memberID){
		String SQL = "select * from orders O "
				+ "inner join orderProducts OP on O.orderID = OP.orderID "
				+ "inner join products P on OP.prodID = P.prodID "
				+ "where O.memberID = ? and O.orderValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Composition> compositionList = new ArrayList<>();
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				int orderID = rs.getInt("orderID");
				String orderAddress = rs.getString("orderAddress");
				String orderPhoneNo = rs.getString("orderPhoneNo");
				int totalPrice = rs.getInt("totalPrice");
				String orderDate = rs.getString("orderDate");
				int orderProdID = rs.getInt("orderProdID");
				int prodID = rs.getInt("prodID");
				int orderQuantity = rs.getInt("orderQuantity");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int prodPrice = rs.getInt("price");
				int prodStock = rs.getInt("stock");
				String prodDetail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
						
				Order order = new Order(orderID, memberID, orderAddress, orderPhoneNo, totalPrice,
						orderDate, 1);
				
				OrderProduct orderProduct = new OrderProduct(orderProdID,orderID, prodID, orderQuantity, 1);
				
				Product product = new Product(prodID, prodCtgID, prodName, prodPrice, prodStock, prodDetail, prodSize, prodOrigin, prodDate,1);
				
				Composition composition = new Composition(order, orderProduct, product);
				
				compositionList.add(composition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Database와 연결 후 반드시 해제시켜주기
			try {
				if (rs != null) {
					rs.close(); // ResultSet을 닫음
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return compositionList;
	}
	
	
	public List<Composition> getSalesByproduct(){
	
		String SQL = "select "
				+ "P.*, "
				+ "O.*, "
				+ "ifnull(SUM(O.orderQuantity),0) AS '판매수량', "
				+ "ifnull(SUM(O.orderQuantity) * P.price, 0) AS '상품별 매출액' "
				+	"from products P "
				+		"left outer join orderProducts O "
				+			"on P.prodID = O.prodID "
				+		"where P.prodValidity = 1 "
				+ "group by P.prodID "
				+ "order by P.prodID";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Composition> compositionList = new ArrayList<>();
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				int orderID = rs.getInt("orderID");
				int orderProdID = rs.getInt("orderProdID");
				int prodID = rs.getInt("prodID");
				int orderQuantity = rs.getInt("orderQuantity");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int prodPrice = rs.getInt("price");
				int prodStock = rs.getInt("stock");
				String prodDetail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
				int salesQuantity = rs.getInt("판매수량");
				int salesByProduct = rs.getInt("상품별 매출액");
				
				OrderProduct orderProduct = new OrderProduct(orderProdID,orderID, prodID, orderQuantity, 1);
				
				Product product = new Product(prodID, prodCtgID, prodName, prodPrice, prodStock, prodDetail, prodSize, prodOrigin, prodDate,1);
				
				Composition composition = new Composition(orderProduct, product, salesQuantity, salesByProduct);
				
				compositionList.add(composition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Database와 연결 후 반드시 해제시켜주기
			try {
				if (rs != null) {
					rs.close(); // ResultSet을 닫음
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return compositionList;
	}
}
