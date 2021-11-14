package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="orders")
public class Orders {
	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date datetime;
	private boolean status;
	
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
}
