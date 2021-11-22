package ptithcm.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Product;
import ptithcm.entity.ProductImgs;

@Transactional
@Controller
public class ProductsContronller {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("/products")
	public String product(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProducts();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("stt", "default");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}
	
	@RequestMapping(value = "/products.htm", params = "asc")
	public String productASC(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProducts();
		Collections.sort(products, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				return (o1.getPrice() - o1.getPrice()*o1.getDiscount() ) > (o2.getPrice() - o2.getPrice()*o2.getDiscount() ) ? 1 : -1;
			}
			
		});
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("filter", "asc");
		model.addAttribute("stt", "asc");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}
	
	@RequestMapping(value = "/products.htm", params = "desc")
	public String productDESC(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProducts();
		Collections.sort(products, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				return (o1.getPrice() - o1.getPrice()*o1.getDiscount() ) < (o2.getPrice() - o2.getPrice()*o2.getDiscount() ) ? 1 : -1;
			}
			
		});
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("filter", "desc");
		model.addAttribute("stt", "desc");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}	
	
	@RequestMapping(value = "/products.htm", params = "new")
	public String productNew(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProducts();		
		Collections.reverse(products);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("filter", "new");
		model.addAttribute("stt", "new");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}	

	@RequestMapping(value = "/products.htm", params = "discount")
	public String productDiscount(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProductsDiscount();		
		Collections.reverse(products);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("filter", "discount");
		model.addAttribute("stt", "discount");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}		

	@RequestMapping(value = "/products.htm", params = "special")
	public String productSpecial(ModelMap model, HttpServletRequest request) {
		List<Product> products = this.getProductsDiscount();		
		Collections.reverse(products);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("count", products.size());
		model.addAttribute("filter", "special");
		model.addAttribute("stt", "special");
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "products";
	}		
	
	// show product controler
	
	@RequestMapping("/{id}.htm")
	public String ShowProduct(ModelMap model, @PathVariable("id") int id) {
		Product p = this.getProduct(id);
		model.addAttribute("product", p);
		model.addAttribute("imgs", this.getProductImgs(id));
		model.addAttribute("list", this.getProducts(p.getCategory().getName()));
		
		return "showproduct";
	}
	
	public Product getProduct(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product as p Where p.id = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Product p = (Product)query.list().get(0);
		session.clear();
		return p;
	}
	
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	public List<Product> getProducts(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product as p where p.category.name = :name";
		Query query = session.createQuery(hql);
		query.setMaxResults(4);
		query.setParameter("name",name );
		List<Product> list = query.list();
		return list;
	}
	
	public List<ProductImgs> getProductImgs(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductImgs as pi Where pi.product.id = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(1);
		List<ProductImgs> imgs = query.list();
		session.clear();
		return imgs;
	}

	
	public List<Product> getProductsDiscount() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product as p where p.discount > 0";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getProductsSpecial() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product as p where p.discount > 0 order by p.discount desc";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

}
