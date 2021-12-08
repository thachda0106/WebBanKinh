package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.sun.org.apache.bcel.internal.generic.NEW;

import ptithcm.entity.Category;

@Transactional
@Controller
@RequestMapping("/admin/category/")
public class AdminCategoryController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String products (HttpServletRequest request, ModelMap model, @ModelAttribute("category") Category category) {
		List<Category> categories = this.getCategories();
		PagedListHolder pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/category";
	}
	
	@RequestMapping(value = "index", params = "btnAdd") 
	public String add(HttpServletRequest request, ModelMap model ,@Validated @ModelAttribute("category") Category category, BindingResult errors) {
		int i = this.InsertCategory(category);
		if(i == 1) {
			model.addAttribute("message", "Thêm danh mục thành công!");
			model.addAttribute("category", new Category() );
		}else {
			model.addAttribute("message", "Thêm danh mục thất bại!");
			model.addAttribute("category", category);
		}
		
		List<Category> categories = this.getCategories();
		PagedListHolder pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/category";
	}

	@RequestMapping(value = "index", params = "btnEdit") 
	public String Update(HttpServletRequest request, ModelMap model ,@Validated @ModelAttribute("category") Category category, BindingResult errors) {
		int i = this.UpdateCategory(category);
		
		if(i == 1) {
			model.addAttribute("message", "Chỉnh sửa danh mục thành công!");
			model.addAttribute("btnStatus", "btnAdd");
			model.addAttribute("category", new Category());
		}else {
			model.addAttribute("message", "Chỉnh sửa danh mục không thành công!");
			model.addAttribute("btnStatus", "btnEdit");
			model.addAttribute("category", category);
		}
		
		List<Category> categories = this.getCategories();
		PagedListHolder pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/category";
	}

	@RequestMapping(value = "{id}.htm", params = "linkDelete")
	public String delete(HttpServletRequest request, ModelMap model 
			,@ModelAttribute("category") Category category, @PathVariable("id") int id) {
		
		Category c = this.getCategory(id);
		int i = this.DeleteCategory(c);
		if(i == 1) {
			model.addAttribute("message", "Xóa danh mục thành công!");
		}else {
			model.addAttribute("message", "Xóa danh mục thất bại. Danh mục đã có sản phẩm!");
		}		
		
		
		List<Category> categories = this.getCategories();
		PagedListHolder pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/category";
	}

	@RequestMapping(value = "{id}.htm", params = "linkEdit")
	public String update(HttpServletRequest request, ModelMap model 
			,@ModelAttribute("category") Category category, @PathVariable("id") int id) {
		
		Category c = this.getCategory(id);			
		List<Category> categories = this.getCategories();
		PagedListHolder pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("category", c);
		return "admin/category";
	}
	
	public List<Category> getCategories() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	public Category getCategory(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category as c Where c.id = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Category c = (Category)query.list().get(0);
		session.clear();
		return c;
	}
	
	public Integer InsertCategory(Category c) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		List<Category> categories = this.getCategories();
		for (Category category : categories) {
			if(category.getName().equals(c.getName())) {
				return 0;
			}
		}
		try {
			session.save(c);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public Integer DeleteCategory(Category c) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(c);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	
	public Integer UpdateCategory(Category c) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		List<Category> categories = this.getCategories();
		for (Category category : categories) {
			if(category.getName().equals(c.getName())) {
				return 0;
			}
		}
		try {
			session.update(c);
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

