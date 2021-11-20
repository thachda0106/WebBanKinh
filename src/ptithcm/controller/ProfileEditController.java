package ptithcm.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Customer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional
public class ProfileEditController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/profile-edit")
	public String profileEdit(ModelMap model, HttpSession request) {
		System.out.println(request.getAttribute("curUser"));
		
		Session session = factory.getCurrentSession();
		String hql = "From UserAccount ";
		Query query = session.createQuery(hql);
	
		List<UserAccount> users = query.list();
		
		for (UserAccount user : users) {
			if (user.getCustomer().getId() == (Integer) (request.getAttribute("curUser"))) {
				model.addAttribute("name", user.getCustomer().getName());
				model.addAttribute("mail", user.getCustomer().getEmail());
				model.addAttribute("phone", user.getCustomer().getPhone());
				model.addAttribute("address", user.getCustomer().getAddress());
				model.addAttribute("username", user.getUsername());
				model.addAttribute("password", user.getPassword());
				model.addAttribute("password1", user.getPassword());
			
				
			}
		}
		return "editProfile";
	}
	
	@RequestMapping("/edit")
	public String user(@RequestParam("password") String password,
			@RequestParam("name") String name, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("email") String email, HttpServletRequest request) {
		String username = request.getParameter("username");
		Customer newCustomer = new Customer(name, address, phone, email, "");
		UserAccount newAccount = new UserAccount(username, password, false, newCustomer);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(newCustomer);
			session.update(newAccount);
			transaction.commit();

			System.out.println("ok");
		} catch (Exception e) {
			transaction.rollback();
		} finally {
			session.close();
		}

		return "profile";
	}	
}