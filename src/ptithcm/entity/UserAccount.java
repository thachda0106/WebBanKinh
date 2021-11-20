package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "useraccount")
public class UserAccount {
	@Id

	@Column(name = "username")
	private String username;
	@Column(name = "password")
	private String password;
	@Column(name = "type")
	private boolean type;
	@OneToOne
	@JoinColumn(name = "customer_id", referencedColumnName = "id")
	private Customer customer;
	
	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public Customer getCustomer() {
		return customer;
	}

	public UserAccount(String username, String password, boolean type, Customer customer) {

		this.username = username;
		this.password = password;
		this.type = type;
		this.customer = customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserAccount() {

	}

	public UserAccount(String password, boolean type, Customer customer) {
	
		this.password = password;
		this.type = type;
		this.customer = customer;
	}

}
