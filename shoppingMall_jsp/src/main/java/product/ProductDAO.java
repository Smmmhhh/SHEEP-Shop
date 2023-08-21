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
		String SQL = "select prodID, ctgID, prodName from products where prodValidity=1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// list 선언
		List<Product> productList = new ArrayList<>();

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int ProdID = rs.getInt("prodID");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");

				Product product = new Product(ProdID, prodCtgID, prodName);
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
	//상품 정보 가져오기
	public Product selGetProdInfrom(int inputProdID) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "select * from products where prodID = ? AND prodValidity=1";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, inputProdID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int prodID = rs.getInt("ProdID");
				int ctgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String detail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
				
				product = new Product(prodID, ctgID, prodName, price, stock, detail, 
						prodSize, prodOrigin, prodDate, 1);
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
		
		return product;

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

	// Category별 List Method
	public List<Product> selectGetCtgProd(int cthID) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Product> productList = new ArrayList<>();

		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "select prodID, ctgID, prodName, price, stock, detail, prodSize, prodOrigin, prodDate \r\n"
					+ "from products where ctgID = ? AND prodValidity = 1;";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cthID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int ProdID = rs.getInt("prodID");
				int prodCtgID = rs.getInt("ctgID");
				String prodName = rs.getString("prodName");
				int prodPrice = rs.getInt("price");
				int prodStock = rs.getInt("stock");
				String prodDetail = rs.getString("detail");
				String prodSize = rs.getString("prodSize");
				String prodOrigin = rs.getString("prodOrigin");
				String prodDate = rs.getString("prodDate");
				
				Product product = new Product(ProdID, prodCtgID, prodName, prodPrice, prodStock, prodDetail, prodSize,
						prodOrigin, prodDate, 1);
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

}
