package ptithcm.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminProductsController {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("products")
	public String products (HttpServletRequest request, ModelMap model) {
		List<Product> products = this.getProducts();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(1);
		pagedListHolder.setPageSize(2);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/products";
	}
	
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
}
