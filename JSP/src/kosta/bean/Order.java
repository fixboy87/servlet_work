package kosta.bean;

public class Order {
	private String product;
	private int price;
	private int qty;
	
	
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	@Override
	public String toString() {
		return "Order [name=" + product + ", price=" + price + ", qty=" + qty + "]";
	}
	
	
}
