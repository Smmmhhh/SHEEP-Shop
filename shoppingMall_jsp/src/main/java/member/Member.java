package member;

import java.sql.Date;

public class Member {
	String memberID;
	String memberPW;
	String memberName;
	String gender;
	String address;
	Date birthDate;
	String memberphoneNo;
	int memberPoint;
	int memberValidity;
	//String memberType;
	
	public Member(String memberID, String memberPW, String memberName, String gender, String address, Date birthDate,
			String memberphoneNo, int memberPoint, int memberValidity) {
		this.memberID = memberID;
		this.memberPW = memberPW;
		this.memberName = memberName;
		this.gender = gender;
		this.address = address;
		this.birthDate = birthDate;
		this.memberphoneNo = memberphoneNo;
		this.memberPoint = memberPoint;
		this.memberValidity = memberValidity;
	}
	
	public String getMemberID() {
		return memberID;
	}
	public String getMemberPW() {
		return memberPW;
	}
	public String getMemberName() {
		return memberName;
	}
	public String getGender() {
		return gender;
	}
	public String getAddress() {
		return address;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public String getMemberphoneNo() {
		return memberphoneNo;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public int getMemberValidity() {
		return memberValidity;
	}

}

