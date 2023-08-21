package order;

public class Order {

	int oderID;
	String memberID;
	String odderAddress;
	String orderPhoneNo;
	int totalPrice;
	String oderDate;
	int oderValidity;

	public Order(int oderID, String memberID, String odderAddress, String orderPhoneNo, int totalPrice, String oderDate,
			int oderValidity) {
		this.oderID = oderID;
		this.memberID = memberID;
		this.odderAddress = odderAddress;
		this.orderPhoneNo = orderPhoneNo;
		this.totalPrice = totalPrice;
		this.oderDate = oderDate;
		this.oderValidity = oderValidity;
	}
	
	public int getOderID() {
		return oderID;
	}

	public String getMemberID() {
		return memberID;
	}

	public String getOdderAddress() {
		return odderAddress;
	}

	public String getOrderPhoneNo() {
		return orderPhoneNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public String getOderDate() {
		return oderDate;
	}

	public int getOderValidity() {
		return oderValidity;
	}
	

}
