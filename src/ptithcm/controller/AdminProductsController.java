package ptithcm.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import ptithcm.bean.UploadImage;
import ptithcm.entity.Category;
import ptithcm.entity.Product;
import ptithcm.entity.ProductImgs;

@Transactional
@Controller
@RequestMapping("/admin/products/")
public class AdminProductsController {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	@Qualifier("uploadimage")
	UploadImage uploadImage;
	
	@RequestMapping("index")
	public String products (HttpServletRequest request, ModelMap model) {
		List<Product> products = this.getProducts();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/products";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET) 
	public String Index(ModelMap model, @ModelAttribute("product") Product product) {	
		return "update/products";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST, params = "btnAdd") 
	public String AddProduct(ModelMap model, @Validated @ModelAttribute("product") Product product, BindingResult errors) {	
		int i = this.InsertProduct(product);
		if(i == 1) {
			model.addAttribute("message", "Thêm sản phẩm thành công!");
			model.addAttribute("product", new Product());
		}else {
			model.addAttribute("product", product);
		}
		
		return "update/products";
	}	

	@RequestMapping(value = "add", method = RequestMethod.POST, params = "btnEdit") 
	public String UpdateProduct(ModelMap model, @Validated @ModelAttribute("product") Product product, BindingResult errors) {	
		int i = this.UpdateProduct(product);
		if(i == 1) {
			model.addAttribute("message", "Chỉnh sửa sản phẩm thành công!");
		}else {
			model.addAttribute("message", "Chỉnh sửa sản phẩm không thành công!");
		}
		model.addAttribute("product", product);
		model.addAttribute("btnStatus", "btnEdit");
		return "update/products";
	}	
	
	@RequestMapping(value = "{id}.htm", params = "linkDelete") 
	public String AddProduct(HttpServletRequest request, ModelMap model,@ModelAttribute("product") Product product, @PathVariable("id") int id) {	
		int i = this.DeleteProduct(this.getProduct(id));
		if(i == 1) {
			model.addAttribute("message", "Xóa sản phẩm thành công!");
		}else {
			model.addAttribute("message", "Xóa sản phẩm thất bại. Sản phẩm này đang được sử dụng!");
		}
		
		List<Product> products = this.getProducts();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/products";
	}	
	
	@RequestMapping(value = "{id}.htm", params = "linkEdit") 
	public String UpdateProduct(ModelMap model, @PathVariable("id") int id) {	

		model.addAttribute("product", this.getProduct(id));
		model.addAttribute("btnStatus", "btnEdit");
		return "update/products";
	}	
	
	@RequestMapping (value = "upload-pimg", method = RequestMethod.POST)
	public String UploadProductImg(ModelMap model, @ModelAttribute("pImg") ProductImgs pImg, @RequestParam("image") MultipartFile image) {
		
		if (image.isEmpty()) {
			model.addAttribute("message", "Bạn chưa chọn ảnh để thêm vào sản phẩm!");
		}
		else {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyHHmmss-"));
				String fileName = date + image.getOriginalFilename();
				String photoPath = uploadImage.basePath + File.separator + fileName;
				image.transferTo(new File(photoPath));    
				pImg.setImg(fileName);
				int i = this.InsertProductImg(pImg);
				if(i==1) {
					model.addAttribute("message", "Thêm ảnh sản phẩm và cập nhật thành công!");
				}else {
					model.addAttribute("message", "Thêm sản phẩm Không thành công!");
				}
				
			} catch (Exception e) {
				model.addAttribute("message","Thêm ảnh không thành công!");
			}
			
		}
		ProductImgs pImgNew = new ProductImgs();
		pImgNew.setProduct(pImg.getProduct());
		model.addAttribute("pInfo", "#"+pImgNew.getProduct().getId() +" - " +pImgNew.getProduct().getName());
		model.addAttribute("pImg", pImgNew);
		return "update/productimgs";
	}
	
	@RequestMapping(value = "{id}.htm", params = "linkImg") 
	public String UpdateProductImgs(ModelMap model, @PathVariable("id") int id) {	
		ProductImgs pImg = new ProductImgs();
		Product p = this.getProduct(id);
		pImg.setProduct(p);
		model.addAttribute("pInfo","#" + p.getId() +" - " + p.getName());
		model.addAttribute("pImg", pImg);
		return "update/productimgs";
	}	
	
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
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
	
	public List<ProductImgs> getProductImgs(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductImgs as pi Where pi.product.id = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<ProductImgs> imgs = query.list();
		session.clear();
		return imgs;
	}	
	
	@ModelAttribute("categories")
	public List<Category> GetCategories(){
		Session session = factory.getCurrentSession();
		String hql = "From Category";
		Query query = session.createQuery(hql);
		List<Category> categories = query.list();
		return categories;
	}
	
	public Integer InsertProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(p);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer InsertProductImg(ProductImgs pImg) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pImg);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public Integer DeleteProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(p);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	
	public Integer UpdateProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(p);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
}
