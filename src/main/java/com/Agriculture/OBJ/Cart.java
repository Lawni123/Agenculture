package com.Agriculture.OBJ;

public class Cart {
	private int prodId;
	 private int userId;
	 private int quantity;
	 private int price;
	 private int cartId;
	 private String productName;
	 private int pPrice;
 public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
public int getCartId() {
	return cartId;
}
public void setCartId(int cartId) {
	this.cartId = cartId;
}
public int getProdId() {
	return prodId;
}
public void setProdId(int prodId) {
	this.prodId = prodId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}

}
