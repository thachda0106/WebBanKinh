package ptithcm.entity;
import java.io.Serializable;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "lineitems")
public class LineItems implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@ManyToOne
	@JoinColumn(name="product_id", referencedColumnName = "id")
	private Product product;
	
	@Id
	@ManyToOne
	@JoinColumn(name="orders_id", referencedColumnName = "id")
	private Orders orders;
	
	private int quantity;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
