package member;

public class Member {
	String memberID;
	String memberPW;
	String memberName;
	String gender;
	String memberAddress;
	String memberPhoneNo;
	int memberPoint;
	int memberValidity;
	//String memberType;
		
	public Member(String memberID, String memberName, String gender, String memberAddress,
			String memberPhoneNo, int memberPoint) {
		this.memberID = memberID;
		this.memberName = memberName;
		this.gender = gender;
		this.memberAddress = memberAddress;
		this.memberPhoneNo = memberPhoneNo;
		this.memberPoint = memberPoint;
	}
	
	public Member(String memberID, String memberPW, String memberName, String gender, String memberAddress,
			String memberPhoneNo, int memberPoint, int memberValidity) {
		this.memberID = memberID;
		this.memberPW = memberPW;
		this.memberName = memberName;
		this.gender = gender;
		this.memberAddress = memberAddress;
		this.memberPhoneNo = memberPhoneNo;
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
	public String getMemberAddress() {
		return memberAddress;
	}
	public String getMemberPhoneNo() {
		return memberPhoneNo;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public int getMemberValidity() {
		return memberValidity;
	}

}

