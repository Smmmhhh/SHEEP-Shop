package orderProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import util.DatabaseUtil;

public class OrderProductDAO {
	
	// 주문상품 추가
	public int insertOrderProduct(List<OrderProduct> list) {
		String SQL = "insert into orderProducts values (?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			for(int i = 0; i < list.size(); i++) {
				pstmt.setString(1, null);
				pstmt.setInt(2, list.get(i).getOrderID());
				pstmt.setInt(3, list.get(i).getProdID());
				pstmt.setInt(4, list.get(i).getOrderQuantity());
				pstmt.setInt(5, 1);
				
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			return 1;
		
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
}


