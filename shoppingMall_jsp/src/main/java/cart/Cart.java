package cart;
import testInter.testInterface; 

public class Cart implements testInterface{
	int cartID;
	int prodID;
	String memberID;
	int cartQuantity;
	
	
	//전체 생성자 
	Cart(int cartID, int ProdID, String memberID, int cartQuantity) {
		this.cartID = cartID;
		this.prodID = ProdID;
		this.memberID = memberID;
		this.cartQuantity = cartQuantity;
		
	}
	
	public int getcartID() {
		return cartID;
	}

	public int getProdID() {
		return prodID;
	}

	public String getuserID() {
		return memberID;
	}

	public int getcartQuantity() {
		return cartQuantity;
	}

}
