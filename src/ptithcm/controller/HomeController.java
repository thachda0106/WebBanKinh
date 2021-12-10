package ptithcm.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Category;
import ptithcm.entity.Customer;
import ptithcm.entity.LineItems;
import ptithcm.entity.Product;


@Transactional
@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/home")
	public String home(ModelMap model, HttpServletRequest request, HttpSession session) {
		List<Product> products = this.getProducts();
		model.addAttribute("products", products);
		request.getServletContext().setAttribute("categories", this.getCategories());
		
		int orderQuantity = 0;
		if(session.getAttribute("curUser") == null) {
			request.getServletContext().setAttribute("orderQuantity", orderQuantity);
		}else {
			int cus_id = (Integer) session.getAttribute("curUser");
			Customer customer = this.getUser(cus_id);
			model.addAttribute("user", customer);
			int od_id =(Integer) session.getAttribute("od_user");
			List<LineItems> litems = this.getLineItemsOfOrder(od_id);
			for (LineItems lineItems : litems) {
				orderQuantity+= lineItems.getQuantity();
			}
			request.getServletContext().setAttribute("orderQuantity", orderQuantity);
		}

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
	public List<LineItems> getLineItemsOfOrder(int od_id){
		Session session = factory.getCurrentSession();
		String hql = "FROM LineItems as litem Where litem.orders.id =:od_id";
		Query query = session.createQuery(hql);
		query.setParameter("od_id", od_id);
		List<LineItems> litems = query.list();
		return litems;
	}
	public Customer getUser(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Customer as user Where user.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Customer user = (Customer) query.list().get(0);
		session.clear();
		return user;
	}
}


