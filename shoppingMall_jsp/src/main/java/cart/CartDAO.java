package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DatabaseUtil;

public class CartDAO {
//	public int cartInsert(int ProdID, String userID, int cartQuantity, int cartValidity) {
//		String SQL = "insert into cartProducts values (?,?,?,?,?)";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DatabaseUtil.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			
//			pstmt.setInt(1, null);
//			pstmt.setInt(2, ProdID);
//			pstmt.setString(3, userID);
//			pstmt.setint(4, cartQuantity);
//			pstmt.setint(5, 1);
//			
//			return pstmt.executeUpdate();
//			
//		}
//	}
}
