package ptithcm.controller;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Product;
import ptithcm.entity.ProductImgs;

@Transactional
@Controller
public class ProductsContronller {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("/products")
	public String product(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "From Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		
		Collection<ProductImgs> listImgs =  list.get(0).getProductImgs();
		for (ProductImgs productImgs : listImgs) {
			System.out.println(productImgs.getImg());
		}
		
		return "products";
	}
}
