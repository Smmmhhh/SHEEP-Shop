import java.sql.Date;

public class Member {
	String memberID;
	String memberPW;
	String memberName;
	String gender;
	Date birthDate;
	int memberPoint;
	int memberValidity;
	//String memberType

	public Member(String memberPW, String memberName, String gender, int memberPoint, int memberValidity,
			String memberID, Date birthDate) {
		this.memberPW = memberPW;
		this.memberName = memberName;
		this.gender = gender;
		this.memberPoint = memberPoint;
		this.memberValidity = memberValidity;
		this.memberID = memberID;
		this.birthDate = birthDate;
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
	public Date getBirthDate() {
		return birthDate;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public int getMemberValidity() {
		return memberValidity;
	}


}
