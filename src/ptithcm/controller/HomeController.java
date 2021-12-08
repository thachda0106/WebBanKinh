package ptithcm.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Category;
import ptithcm.entity.Product;


@Transactional
@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/home")
	public String home(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProducts();
		model.addAttribute("products", products);
		request.getServletContext().setAttribute("categories", this.getCategories());
		return "/home";
	}
	
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "  FROM Product as p where p.discount > 0 order by p.discount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(8);
		List<Product> list = query.list();
		return list;
	}	
	public List<Category> getCategories() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
}


