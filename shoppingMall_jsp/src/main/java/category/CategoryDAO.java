package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import product.Product;
import util.DatabaseUtil;

public class CategoryDAO {

	public List<Category> selectCategory() {
		String SQL = "select ctgID, ctgName from categories";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// list 선언
		List<Category> categoryList = new ArrayList<>();

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int ctgID = rs.getInt("ctgID");
				String ctgName = rs.getString("ctgName");

				Category category = new Category(ctgID, ctgName);
				categoryList.add(category);
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
		return categoryList;
	}
	
	public int selectCategoryID() {
		return 0;
		
	}
	

}
