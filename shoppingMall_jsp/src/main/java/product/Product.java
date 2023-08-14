package product;

public class Product {
	int prodCtgID;
	String prodName;
	int prodPrice;
	int prodStock;
	String prodDetail;
	String prodSize;
	String prodOrigin;
	String prodDate;

	Product(int prodCtgID, String prodName, int prodPrice, int prodStock, String prodDetail, String prodSize,
			String prodOrigin, String prodDate) {

		this.prodCtgID = prodCtgID;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodStock = prodStock;
		this.prodDetail = prodDetail;
		this.prodSize = prodSize;
		this.prodOrigin = prodOrigin;
		this.prodDate = prodDate;
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

}
