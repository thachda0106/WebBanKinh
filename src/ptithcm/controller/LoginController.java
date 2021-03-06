package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
import ptithcm.entity.Orders;
import ptithcm.entity.Product;
import ptithcm.entity.UserAccount;

@Controller
@Transactional
public class LoginController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/loginC")
	public String loginUser(ModelMap model, HttpSession httpSession, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		Session session = factory.getCurrentSession();
		String hql = "From UserAccount";
		Query query = session.createQuery(hql);
		List<UserAccount> users = query.list();
		for (UserAccount user : users) {
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				if (user.isType() == true) {
					httpSession.setAttribute("curUser", user.getCustomer().getId());
					httpSession.setAttribute("isAdmin", "true");
					model.addAttribute("user", user.getCustomer().getName());
					return "redirect:/admin/home.htm";
				} else {
					httpSession.setAttribute("curUser", user.getCustomer().getId());
					httpSession.setAttribute("isAdmin", "false");
					model.addAttribute("user", user.getCustomer().getName());
					this.getOrderId(model, httpSession);
					return "redirect:/home.htm";
				}
			}
		}
		model.addAttribute("alert","Sai t??n ????ng nh???p ho???c m???t kh???u!");
		
		return "login";
	}
	@RequestMapping("/logout")
	public String logout(ModelMap model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home.htm";
	}
	
	@RequestMapping("/admin/logout")
	public String Adminlogout(ModelMap model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home.htm";
	}
	
	public void getOrderId(ModelMap model, HttpSession request) {
		int id_user = (Integer) request.getAttribute("curUser");
		int number = 0;
		Session session = factory.getCurrentSession();
		String hql = "From Orders ";
		Query query = session.createQuery(hql);
		List<Orders> orders = query.list();
		for (Orders order : orders) {
			if (order.getCustomer().getId() == id_user && order.isStatus() == false) {
				number = order.getId();				
				request.setAttribute("od_user", order.getId());
			}
		}
		if(number == 0) {
			Orders newOrder = createOrder(id_user);
			InsertOrder(newOrder);
				query = session.createQuery(hql);
				orders = query.list();
				for (Orders order : orders) {
					if (order.getCustomer().getId() == id_user && order.isStatus() == false) { 
						request.setAttribute("od_user", order.getId());
					}
				}

		}
	}
	
	
	
	public void InsertOrder(Orders order){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		

		try {
			session.save(order);
			t.commit();
			System.out.println("T???o order m???i th??nh c??ng!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("ko t???o ??c order m???i!");
		} finally {
			session.close();
		}
	}
	
	public Orders createOrder(int id_user) {
		Orders order = new Orders();
		order.setId(0);
		String dateNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateNow);
			order.setDatetime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setStatus(false);
		Session session = factory.getCurrentSession();
		String hql = "From Customer ";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			if (customer.getId() == id_user) {
				order.setCustomer(customer);
			}
		}
		return order;
	}
	
	
}
