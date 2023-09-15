package composition;

import cart.Cart;
import category.Category;
import member.Member;
import order.Order;
import orderProduct.OrderProduct;
import product.Product;

public class Composition {
	
	 // 모든 클래스를 Composition class의 member변수로 정의시킨다.
	Cart cart;
	Product product;
	Category category;
	Member member;
	Order order;
	OrderProduct orderProduct;
	
	int salesQuantity;			//데이터 페이지 판매수량
	int salesByProduct;			//데이터 페이지 상품별 매출금액
	
	Composition(){}
	
	 // Table Join을 할 때 포함되는 class들의 생성자를 만들어준다.
	Composition(Cart cart, Product product){
		this.cart = cart;
		this.product = product;
	}
	
	Composition(Order order, OrderProduct orderProduct, Product product){
		this.order = order;
		this.orderProduct = orderProduct;
		this.product = product;
	}
	
	// 데이터 페이지 상품별 총 매출액 생성자
	Composition(OrderProduct orderProduct, Product product, int salesQuantity, int salesByProduct){
		this.orderProduct = orderProduct;
		this.product = product;
		this.salesQuantity = salesQuantity;
		this.salesByProduct = salesByProduct;
		
	}
	

	public Cart getCart() {
		return cart;
	}

	public Product getProduct() {
		return product;
	}

	public Category getCategory() {
		return category;
	}

	public Member getMember() {
		return member;
	}

	public Order getOrder() {
		return order;
	}

	public OrderProduct getOrderProduct() {
		return orderProduct;
	}
	
	public int getSalesQuantity() {
		return salesQuantity;
	}

	public int getSalesByProduct() {
		return salesByProduct;
	}

}