package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Product;
import ptithcm.entity.ProductImgs;

@Transactional
@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/home")
	public String home(ModelMap model) {
		List<Product> products = this.getProducts();
		model.addAttribute("products", products);
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
	
}


