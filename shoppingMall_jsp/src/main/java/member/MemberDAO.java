package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	//회원 정보 수정(패스워드 수정)
	public int updateMemberInfo(String memberID, String memberNewPW, String phoneNo, String memberAddress) {
		String SQL = "update members set passwd = ?, phoneNo = ?, memberAddress = ? "
				+ "where memberID = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberNewPW);
			pstmt.setString(2, phoneNo);
			pstmt.setString(3, memberAddress);
			pstmt.setString(4, memberID);
			
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
	
	//회원 정보 수정(포인트 수정)
	public int updateMemberInfo(String memberID, int point) {
		String SQL = "update members set memberPoint = ? "
				+ "where memberID = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, point);
			pstmt.setString(2, memberID);

			
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
	
	//관리자 회원 삭제 validity=0으로 설정
		public int deleteMember(String memberID) {
			String SQL = "update members set memberValidity= 0 where memberID = ? and memberValidity = 1";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, memberID);
				
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
	
	//User 정보 받아오기
	public Member selGetUserInfo(String memberID) {
		String SQL = "select * from members where memberID = ? and memberValidity = 1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		Member member = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String userName = rs.getString("memberName");
				String gender = rs.getString("gender");
				String address = rs.getString("memberAddress");
				String phoneNo= rs.getString("phoneNo");
				int point = rs.getInt("memberPoint");
				
				member = new Member(memberID, userName, gender, address, phoneNo, point);
			}
			
			return member;
		
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
		
		return member;
	}
	
	//User 정보 받아오기
		public List<Member> selGetUserList() {
			String SQL = "select * from members where memberValidity = 1";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<Member> memberList = new ArrayList<>();
			Member member = null;
			
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
								
				while(rs.next()) {
					String memberID = rs.getString("memberID");
					String userName = rs.getString("memberName");
					String gender = rs.getString("gender");
					String address = rs.getString("memberAddress");
					String phoneNo= rs.getString("phoneNo");
					int point = rs.getInt("memberPoint");
					
					member = new Member(memberID, userName, gender, address, phoneNo, point);
					memberList.add(member);
				}
							
			} catch(Exception e) {
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
			
			return memberList;
		}


}
