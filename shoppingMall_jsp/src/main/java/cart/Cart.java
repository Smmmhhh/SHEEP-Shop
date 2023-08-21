package cart;

public class Cart {
	int cartProdID;
	int ProdID;
	String userID;
	int cartQuantity;
	int cartValidity;
	
	//전체 생성자 
	Cart(int cartProdID, int ProdID, String userID, int cartQuantity, int cartValidity) {
		this.cartProdID = cartProdID;
		this.ProdID = ProdID;
		this.userID = userID;
		this.cartQuantity = cartQuantity;
		this.cartValidity = cartValidity;
	}
	
	public int getcartProdID() {
		return cartProdID;
	}

	public int getProdID() {
		return ProdID;
	}

	public String getuserID() {
		return userID;
	}

	public int getcartQuantity() {
		return cartQuantity;
	}

	public int getcartValidity() {
		return cartValidity;
	}

}
