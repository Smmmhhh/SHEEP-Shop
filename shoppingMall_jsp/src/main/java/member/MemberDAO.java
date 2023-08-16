package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class MemberDAO {
	//회원가입
	public int join(String memberID, String memberPW, String memberName,
			String gender, String phoneNo, String memberAddress) {
		String SQL = "insert into members values (?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, memberPW);
			pstmt.setString(3, memberName);
			pstmt.setString(4, gender);
			pstmt.setString(5, phoneNo);
			pstmt.setString(6, memberAddress);
			pstmt.setInt(7, 1000);
			pstmt.setInt(8, 1);
						
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
	
	//로그인을 위한 정보 확인
	public boolean login(String memberID, String memberPW) {
		String SQL = "select * from members where memberID = ? and passwd = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, memberPW);
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
	
	//회원 정보 수정
	public int update(String memberID, String memberPresentPW, String memberNewPW, String phoneNo, String memberAddress) {
		String SQL = "update members set passwd = ?, phoneNo = ?, memberAddress = ? "
				+ "where memberID = ? and passwd = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberPresentPW);
			pstmt.setString(2, phoneNo);
			pstmt.setString(3, memberAddress);
			pstmt.setString(4, memberID);
			pstmt.setString(5, memberNewPW);
			
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

	
	
	//회원 탈퇴 validity=0으로 설정
	public int cancel(String memberID, String memberPW) {
		String SQL = "update members set memberValidity= 0 where memberID = ? and passwd = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, memberPW);
			
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
