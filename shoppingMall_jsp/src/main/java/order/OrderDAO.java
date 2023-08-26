package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class OrderDAO {
	
	public int insertOrder(String memberID, String orderAddress, String orderPhoneNo, int totalPrice) {
		
		String SQL = "insert into orders values (?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL, PreparedStatement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, null);
			pstmt.setString(2, memberID);
			pstmt.setString(3, orderAddress);
			pstmt.setString(4, orderPhoneNo);
			pstmt.setInt(5, totalPrice);
			//pstmt.setString(6, null);
			pstmt.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, 1);

			int affectedRows = pstmt.executeUpdate();
			
	        if (affectedRows == 0) {
	            throw new SQLException("Creating order failed, no rows affected.");
	        }
			//insert 후 PK값 가져오기
	        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                int orderId = generatedKeys.getInt(1); // 가져온 auto-increment 값
	                return orderId;
	            } else {
	                throw new SQLException("Creating order failed, no ID obtained.");
	            }
	        }
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// Database와 연결 후 반드시 해제시켜주기
			try {
				// pstmt를 전역변수로 null로 초기화를 해줬기 때문에 참조시 NullPointerException이 발생 할 수도 있다.
				if (pstmt != null) {
					pstmt.close();
				}
				// conn를 전역변수로 null로 초기화를 해줬기 때문에 참조시 NullPointerException이 발생 할 수도 있다.
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
