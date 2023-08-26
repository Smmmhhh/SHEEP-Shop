package order;

public class Order {

	int orderID;
	String memberID;
	String orderAddress;
	String orderPhoneNo;
	int totalPrice;
	String orderDate;
	int orderValidity;

	public Order(int orderID, String memberID, String orderAddress, String orderPhoneNo, int totalPrice, String orderDate,
			int orderValidity) {
		this.orderID = orderID;
		this.memberID = memberID;
		this.orderAddress = orderAddress;
		this.orderPhoneNo = orderPhoneNo;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.orderValidity = orderValidity;
	}
	
	public int getOrderID() {
		return orderID;
	}

	public String getMemberID() {
		return memberID;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public String getOrderPhoneNo() {
		return orderPhoneNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public int getOrderValidity() {
		return orderValidity;
	}
	

}
