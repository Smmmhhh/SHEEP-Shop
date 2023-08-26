package cart;

public class Cart{
	int cartID;
	int prodID;
	String memberID;
	int cartQuantity;
	
	
	//전체 생성자 
	public Cart(int cartID, int prodID, String memberID, int cartQuantity) {
		this.cartID = cartID;
		this.prodID = prodID;
		this.memberID = memberID;
		this.cartQuantity = cartQuantity;
		
	}
	
	public int getCartID() {
		return cartID;
	}

	public int getProdID() {
		return prodID;
	}

	public String getUserID() {
		return memberID;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

}
