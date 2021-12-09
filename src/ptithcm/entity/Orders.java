package ptithcm.entity;


import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="orders")
public class Orders {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "id")
	private int id;
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "datetime")
	private Date datetime;
	@Column(name = "status")
	private boolean status;
	@Column(name = "total")
	private int total;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@OneToMany(mappedBy = "orders", fetch =FetchType.EAGER)
	private Collection<LineItems> lineitems;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}



	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Collection<LineItems> getLineitems() {
		return lineitems;
	}
	public void setLineitems(Collection<LineItems> lineitems) {
		this.lineitems = lineitems;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Orders(int id, Date datetime, boolean status, int total, Customer customer,
			Collection<LineItems> lineitems) {
		this.id = id;
		this.datetime = datetime;
		this.status = status;
		this.total = total;
		this.customer = customer;
		this.lineitems = lineitems;
	}
	public Orders() {
	}
	
	
}