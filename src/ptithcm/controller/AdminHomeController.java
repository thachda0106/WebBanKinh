package ptithcm.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.UserAccount;
@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminHomeController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("home")
	public String home(HttpServletRequest request, HttpSession session) {
		UserAccount user = this.getUser((int)session.getAttribute("curUser"));
		request.getServletContext().setAttribute("AdminName", user.getUsername());
		return "admin/home";
	}
	
	public UserAccount getUser(int id) {
		Session session = factory.getCurrentSession();
		String hql = "From UserAccount as us where us.customer.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		UserAccount user = (UserAccount)query.list().get(0);
		return user;
	}
}
