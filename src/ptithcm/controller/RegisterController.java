
package ptithcm.controller;






import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Customer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional

public class RegisterController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/registerC")
	public String user(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("address") String address,
			@RequestParam("phone") String phone,
			@RequestParam("email") String email) {
		
		Customer newCustomer = new Customer(name, address, phone, email,"");
		UserAccount newAccount = new UserAccount(username, password, false, newCustomer);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(newCustomer);
			session.save(newAccount);
			transaction.commit();
			
			System.out.println("ok");
		} catch (Exception e) {
			transaction.rollback();
		}finally {
			session.close();
		}
		
		
		return "/login";
	}	
}
