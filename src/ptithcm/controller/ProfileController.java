package ptithcm.controller;




import java.util.*;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Customer;

@Controller
@Transactional
public class ProfileController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("/profile")
	public String profile(ModelMap model, HttpSession request) {
		request.getAttribute("curUser");
		Session session = factory.getCurrentSession();
		String hql = "From Customer ";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			if (customer.getId() == (Integer) (request.getAttribute("curUser"))) {
				model.addAttribute("name", customer.getName());
				model.addAttribute("mail", customer.getEmail());
				model.addAttribute("phone", customer.getPhone());
				model.addAttribute("address", customer.getAddress());
			}
		}
		return "profile";
	}
	
	
}
