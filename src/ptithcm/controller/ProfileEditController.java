package ptithcm.controller;

import java.util.List;


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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Customer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional
public class ProfileEditController {

	@Autowired
	SessionFactory factory;

	@RequestMapping(value="/profile-edit", method = RequestMethod.POST)
	public String profileEdit(ModelMap model, HttpSession request) {

		List<UserAccount> users = this.getUsers();

		for (UserAccount user : users) {
			if (user.getCustomer().getId() == (Integer) (request.getAttribute("curUser"))) {
				model.addAttribute("name", user.getCustomer().getName());
				model.addAttribute("email", user.getCustomer().getEmail());
				model.addAttribute("phone", user.getCustomer().getPhone());
				model.addAttribute("address", user.getCustomer().getAddress());
				model.addAttribute("username", user.getUsername());
				model.addAttribute("password", user.getPassword());
				model.addAttribute("password1", user.getPassword());

			}
		}
		return "editProfile";
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST )
	public String user(@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("email") String email, HttpSession request, ModelMap model) {
		int id = (Integer) request.getAttribute("curUser");
		System.out.println(id);
		List<UserAccount> users = this.getUsers();

		for (UserAccount user : users) {
			if (user.getCustomer().getId() == (Integer) (request.getAttribute("curUser"))) {
				String username = user.getUsername();
				Customer newCustomer = new Customer(id, name, address, phone, email, "");
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
					e.printStackTrace();
				} finally {
					session.close();
				}

			}
		}

		return "redirect:/profile.htm";

	}
	


	public List<UserAccount> getUsers() {

		Session session = factory.getCurrentSession();
		String hql = "From UserAccount ";
		Query query = session.createQuery(hql);

		List<UserAccount> users = query.list();
		return users;
	}
}