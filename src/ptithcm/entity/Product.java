package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	@NotEmpty(message = "Không được để trống tên sản phẩm!")
	private String name;
	@Column(name = "description")
	@NotEmpty(message = "Không được để trống mô tả!")
	private String description;
	@Column(name = "price")
	@NotNull(message = "Không được để trống giá tiền!")
	@Min(value = 0, message = "Giá tiền không hợp lệ!")
	private int price;
	@Column(name = "discount")
	@DecimalMin(value = "0.0", message = "Giá tiền không hợp lệ!")
	@DecimalMax(value = "1.0", message = "Giá tiền không hợp lệ!")
	private float discount;
	@Column(name = "quantity")
	@NotNull(message = "Không được để trống số lương sản phẩm!")
	@Min(value = 1, message = "số sản phẩm phải > 0!")
	private int quantity;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<ProductImgs> productImgs;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<ProductImgs> getProductImgs() {
		return productImgs;
	}

	public void setProductImgs(Collection<ProductImgs> productImgs) {
		this.productImgs = productImgs;
	}
	
	
}
