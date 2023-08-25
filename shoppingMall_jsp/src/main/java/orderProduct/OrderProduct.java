package orderProduct;

public class OrderProduct {
	int orderProdID;
	int orderID;
	int prodID;
	int orderQuantity;
	int orderProdValidity;
	
	public OrderProduct(int orderProdID, int orderID, int prodID, int orderQuantity, int orderProdValidity) {
		this.orderProdID = orderProdID;
		this.orderID = orderID;
		this.prodID = prodID;
		this.orderQuantity = orderQuantity;
		this.orderProdValidity = orderProdValidity;
	}
	
	public int getOrderProdID() {
		return orderProdID;
	}

	public int getOrderID() {
		return orderID;
	}

	public int getProdID() {
		return prodID;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public int getOrderProdValidity() {
		return orderProdValidity;
	}	
	
}
