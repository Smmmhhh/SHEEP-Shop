package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DatabaseUtil;

public class CartDAO {

	// List 선언
	public List<Cart> getCartList(String memberID){
		String SQL = "select * FROM carts WHERE memberID = ?" ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Cart> cartList = new ArrayList<>();
	
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int cartID = rs.getInt("cartID");
				int prodID = rs.getInt("prodID");
				int cartQuantity = rs.getInt("cartQuantity");
				
				
				Cart cart = new Cart(cartID, prodID, memberID, cartQuantity);
				cartList.add(cart);
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
		return cartList;
	}
	
	// 고객의 선택한 상품 정보 조회
	public Cart getCartList(String cartMemberID, int cartProdID){
		String SQL = "select * from carts where memberID = ? and prodID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cart cart = null;

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cartMemberID);
			pstmt.setInt(2, cartProdID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int cartID = rs.getInt("cartID");
				int prodID = rs.getInt("prodID");
				String memberID = rs.getString("memberID");
				int cartQuantity = rs.getInt("cartQuantity");
			
				cart = new Cart(cartID, prodID, memberID, cartQuantity);
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
		return cart;
	}
	
	// 장바구니 상품 넣기
	public int cartInsert(String memberID, int prodID, int Quantity) {
		String SQL = "insert into carts values (?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, null);
			pstmt.setString(2, memberID);
			pstmt.setInt(3, prodID);
			pstmt.setInt(4, Quantity);

	
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			try {
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
		return -1;
	}
	

	// 장바구니 수량 수정하기(단일품목)
		public int updateCartProdEdit(int cartQuantity, String memberID, int prodID) {
			String SQL = "update carts set cartQuantity = ? where memberID = ? and prodID = ?";

			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setInt(1, cartQuantity);
				pstmt.setString(2, memberID);
				pstmt.setInt(3, prodID);

				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				try {
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
			return -1;
		}
		
		
		// 결제시 장바구니 삭제하기
		public int deleteCartProd(List<Cart> list) {
			String SQL = "delete from carts where memberID = ? and prodID = ? ";

			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				for(int i = 0; i < list.size(); i++) {
					pstmt.setString(1, list.get(i).getUserID());
					pstmt.setInt(2, list.get(i).getProdID());
					
					pstmt.addBatch();
				}
				pstmt.executeBatch();
				return 1;

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				try {
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
			return -1;
		}
		
		
	 
		// 장바구니 상품 삭제하기
		public int cartProductDelete(String memberID, int prodID) {
			String SQL = "DELETE FROM carts WHERE memberID = ? AND prodID = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, memberID);
				pstmt.setInt(2, prodID);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				try {
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
			return -1;
		}
		
}
