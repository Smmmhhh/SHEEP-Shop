package product;

public class Product {
	int ProdID;
	int prodCtgID;
	String prodName;
	int prodPrice;
	int prodStock;
	String prodDetail;
	String prodSize;
	String prodOrigin;
	String prodDate;
	int prodValidity;
	
	//전체 생성자 
	public Product(int ProdID, int prodCtgID, String prodName, int prodPrice, int prodStock, String prodDetail, String prodSize,
			String prodOrigin, String prodDate, int prodValidity) {
		this.ProdID = ProdID;
		this.prodCtgID = prodCtgID;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodStock = prodStock;
		this.prodDetail = prodDetail;
		this.prodSize = prodSize;
		this.prodOrigin = prodOrigin;
		this.prodDate = prodDate;
		this.prodValidity = prodValidity;
	}
	
	// 제품id,제품 카테고리, 제품이름 생성자
	Product(int ProdID, int prodCtgID, String prodName) {
		this.ProdID = ProdID;
		this.prodCtgID = prodCtgID;
		this.prodName = prodName;
	}
	
	
	public int getProdID() {
		return ProdID;
	}

	public int getProdCtgID() {
		return prodCtgID;
	}

	public String getProdName() {
		return prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public int getProdStock() {
		return prodStock;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public String getProdSize() {
		return prodSize;
	}

	public String getProdOrigin() {
		return prodOrigin;
	}

	public String getProdDate() {
		return prodDate;
	}
	
	public int prodValidity() {
		return prodValidity;
	}

}
