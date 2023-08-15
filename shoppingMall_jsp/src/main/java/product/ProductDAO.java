package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;

public class ProductDAO {
	public int prodInsert(int prodCtgID, String prodName, 
			int prodPrice, int prodStock, String prodDetail, 
			String prodSize, String prodOrigin, String prodDate) {
		String SQL = "insert into members values (?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prodCtgID);
			pstmt.setString(2, prodName);
			pstmt.setInt(3, prodPrice);
			pstmt.setInt(4, prodStock);
			pstmt.setString(5, prodDetail);
			pstmt.setString(6, prodSize);
			pstmt.setString(7, prodOrigin);
			pstmt.setString(8, prodDate);
			pstmt.setInt(9, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}


}
