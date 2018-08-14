package mission01;

public class Product {
	String apple;
	String mandarine;
	String pineapple;
	String Grapefruit;
	String lemon;
	
	public String getApple() {
		return apple;
	}
	public void setApple(String apple) {
		this.apple = apple;
	}
	public String getMandarine() {
		return mandarine;
	}
	public void setMandarine(String mandarine) {
		this.mandarine = mandarine;
	}
	public String getPineapple() {
		return pineapple;
	}
	public void setPineapple(String pineapple) {
		this.pineapple = pineapple;
	}
	public String getGrapefruit() {
		return Grapefruit;
	}
	public void setGrapefruit(String grapefruit) {
		Grapefruit = grapefruit;
	}
	public String getLemon() {
		return lemon;
	}
	public void setLemon(String lemon) {
		this.lemon = lemon;
	}
	
	@Override
	public String toString() {
		return "Product [apple=" + apple + ", mandarine=" + mandarine + ", pineapple=" + pineapple + ", Grapefruit="
				+ Grapefruit + ", lemon=" + lemon + "]";
	}
	
}
