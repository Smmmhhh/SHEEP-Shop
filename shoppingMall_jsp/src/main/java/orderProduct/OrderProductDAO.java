package orderProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class OrderProductDAO {
	
	// 주문상품 추가
	public int insertOrderProduct(int orderID, int prodID, int orderQuantity) {
		String SQL = "insert into members values (?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, null);
			pstmt.setInt(2, orderID);
			pstmt.setInt(3, prodID);
			pstmt.setInt(4, orderQuantity);
			pstmt.setInt(5, 1);

			return pstmt.executeUpdate();
		
		} catch( Exception e) {
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
	
	// 주문상품 불러오기
	public boolean sel_orderProduct(int orderID) {
		String SQL = "select * from members where orderID = ? and orderProdValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderID);
			ResultSet rs = pstmt.executeQuery();
						
	        return rs.next(); // If there's a matching row, rs.next() will return true.
		
		} catch(Exception e) {
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
		
		return false;
	}
	
	//주문상품 삭제
	public int deleteOrderProduct(String orderID) {
		String SQL = "update members set orderProdValidity= 0 where orderID = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, orderID);
			
			return pstmt.executeUpdate();
		
		} catch( Exception e) {
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
	
	// 한 주문당 개수 가져오기
	public int getOrderProductCount(int orderID) {
		String SQL = "select count(*) as count from orderProducts where orderID = ?;";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int count = 0;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderID);
			ResultSet rs = pstmt.executeQuery();
				
			if(rs.next()) {
				count=rs.getInt("count");
			}
			
	        return count; // If there's a matching row, rs.next() will return true.
		
		} catch(Exception e) {
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
		
		return count;
	}
}


