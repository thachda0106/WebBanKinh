
package ptithcm.controller;

import java.util.*;

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
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Customer;
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
					return "/admin/home";
				} else {
					httpSession.setAttribute("curUser", user.getCustomer().getId());
					httpSession.setAttribute("isAdmin", "false");
					model.addAttribute("user", user.getCustomer().getName());
					return "/home";
				}
			}
		}
		model.addAttribute("alert","Sai tên đăng nhập hoặc mật khẩu");
		
		return "login";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/home";
	}
}
