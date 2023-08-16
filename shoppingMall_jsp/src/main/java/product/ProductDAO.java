package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class ProductDAO {
	public int prodInsert(int prodCtgID, String prodName, int prodPrice, int prodStock, String prodDetail,
			String prodSize, String prodOrigin, String prodDate) {
		String SQL = "insert into products values (?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, null);
			pstmt.setInt(2, prodCtgID);
			pstmt.setString(3, prodName);
			pstmt.setInt(4, prodPrice);
			pstmt.setInt(5, prodStock);
			pstmt.setString(6, prodDetail);
			pstmt.setString(7, prodSize);
			pstmt.setString(8, prodOrigin);
			pstmt.setString(9, prodDate);
			pstmt.setInt(10, 1);

			return pstmt.executeUpdate();

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

	public List<Product> getProductList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// list 선언
		List<Product> productList = new ArrayList<>();
		String SQL = "select prodID, prodName from products where prodValidity=?";

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, 1);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int ProdID = rs.getInt("prodID");
				String prodName = rs.getString("prodName");

				Product product = new Product(ProdID, prodName);
				productList.add(product);
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
		return productList;
	}

	public String getProdName(int prodID) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String prodName = null;

		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "select prodName from products where prodID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prodID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				prodName = rs.getString("prodName");
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

		return prodName;

	}

	public int updateProductEdit(String prodName, int selectedCategory, int prodPrice, int prodStock, String prodDetail,
			String prodSize, String prodOrigin, String prodDate, int prodID) {
		String SQL = "UPDATE products SET prodName = ?, ctgID = ?, price = ?, stock = ?, detail = ?, \r\n"
				+ "prodSize = ?, prodOrigin = ?, prodDate = ? WHERE prodID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, prodName);
			pstmt.setInt(2, selectedCategory);
			pstmt.setInt(3, prodPrice);
			pstmt.setInt(4, prodStock);
			pstmt.setString(5, prodDetail);
			pstmt.setString(6, prodSize);
			pstmt.setString(7, prodOrigin);
			pstmt.setString(8, prodDate);
			pstmt.setInt(9, prodID);

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

	public int updateProductdelete(int prodID) {
		String SQL = "UPDATE products SET prodValidity = ? WHERE prodID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, 0);
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
