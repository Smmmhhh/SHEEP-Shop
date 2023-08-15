package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;

public class MemberDAO {
	public int join(String memberID, String memberPW, String memberName,
			String gender, String phoneNo, String memberAddress) {
		String SQL = "insert into members values (?,?,?,?,?,?,?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, memberPW);
			pstmt.setString(3, memberName);
			pstmt.setString(4, gender);
			pstmt.setString(5, phoneNo);
			pstmt.setString(6, memberAddress);
			pstmt.setInt(7, 1000);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int login(String memberID, String memberPW) {
		String SQL = "select * from members where memberID = '"+memberID
				+"' and meberPW = '"+memberPW+"'";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, memberPW);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
