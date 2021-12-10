package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Customer;
import ptithcm.entity.LineItems;
import ptithcm.entity.Orders;
import ptithcm.entity.Product;


@Transactional
@Controller
public class CartController {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("/cart")
	public String cart(ModelMap model, HttpSession request) {
		int cus_id = (Integer) request.getAttribute("curUser");
		Customer customer = this.getUser(cus_id);
		model.addAttribute("user", customer);
		int od_id =(Integer) request.getAttribute("od_user");
		
		List<LineItems> litems = this.getLineItemsOfOrder(od_id);
		model.addAttribute("list_lineItems", litems);
		
		return "cart";
	}
	
	@RequestMapping(value="/cart.htm", params="comfirm")
	public String confirm(ModelMap model, HttpSession request, HttpServletRequest ServletRequest ) {
		int cus_id = (Integer) request.getAttribute("curUser");
		Customer customer = this.getUser(cus_id);
		model.addAttribute("user", customer);
		int od_id =(Integer) request.getAttribute("od_user");
		Orders od = this.getOrder(od_id);
		String dateNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateNow);
			od.setDatetime(date);
		} catch (ParseException e) {
			System.out.println("Ko thể cập nhật lại ngày giờ!!");
		}
		od.setStatus(true);
		this.updateOrder(od);
		this.getOrderId(model, request);
		int newOrderId = (Integer) request.getAttribute("od_user");
		List<LineItems> litems = this.getLineItemsOfOrder(newOrderId);
		model.addAttribute("list_lineItems", litems);
		model.addAttribute("MessComfirm", "Đã đặt hàng thành công! Chúc Bạn 1 ngày tốt lành!");
		ServletRequest.getServletContext().setAttribute("orderQuantity", 0);
		return "cart";
	}
	
	@RequestMapping(value="/cart.htm", params="editAddress")
	public String cartEditInfo(ModelMap model, HttpSession request,@RequestParam("address") String address) {
		int cus_id = (Integer) request.getAttribute("curUser");
		Customer customer = this.getUser(cus_id);
		customer.setAddress(address);
		this.updateInfo(customer);
		model.addAttribute("user", customer);
		int od_id =(Integer) request.getAttribute("od_user");
		
		List<LineItems> litems = this.getLineItemsOfOrder(od_id);
		model.addAttribute("list_lineItems", litems);
		
		return "cart";
	}
	
	@RequestMapping("/cart/{pd_id}/{sl}.htm")
	public String updateCart(ModelMap model, HttpServletRequest ServletRequest  ,HttpSession request, @PathVariable("pd_id") int pd_id, @PathVariable("sl") int sl){
		int cus_id = (Integer) request.getAttribute("curUser");
		Customer customer = this.getUser(cus_id);
		model.addAttribute("user", customer);
		int od_id =(Integer) request.getAttribute("od_user");
		LineItems litem = this.findLineItem(pd_id, od_id);
		litem.setQuantity(sl);
		this.updateLineItem(litem);
		List<LineItems> litems = this.getLineItemsOfOrder(od_id);
		// 
		int orderQuantity = 0;
		for (LineItems lineItems : litems) {
			orderQuantity += lineItems.getQuantity();
		}
		ServletRequest.getServletContext().setAttribute("orderQuantity", orderQuantity);
		model.addAttribute("list_lineItems", litems);
		return "cart";
		
	}
	
	@RequestMapping("/cart/{pd_id}.htm")
	public String deleteLitem(ModelMap model,HttpServletRequest ServletRequest  , HttpSession request, @PathVariable("pd_id") int pd_id) {
		int cus_id = (Integer) request.getAttribute("curUser");
		Customer customer = this.getUser(cus_id);
		model.addAttribute("user", customer);
		int od_id =(Integer) request.getAttribute("od_user");
		LineItems litem = this.findLineItem(pd_id, od_id);

		this.deleteLineItem(litem);
		List<LineItems> litems = this.getLineItemsOfOrder(od_id);
		// 
		int orderQuantity = 0;
		for (LineItems lineItems : litems) {
			orderQuantity += lineItems.getQuantity();
		}
		ServletRequest.getServletContext().setAttribute("orderQuantity", orderQuantity);
		model.addAttribute("list_lineItems", litems);
		return "cart";
	}
	
	
	public List<LineItems> getLineItemsOfOrder(int od_id){
		Session session = factory.getCurrentSession();
		String hql = "FROM LineItems as litem Where litem.orders.id =:od_id";
		Query query = session.createQuery(hql);
		query.setParameter("od_id", od_id);
		List<LineItems> litems = query.list();
		return litems;
	}
	
	public void updateLineItem(LineItems litem) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(litem);
			t.commit();
			System.out.println("update lineitem mới thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("update lineitem mới thất bại!");
		} finally {
			session.close();
		}
	}
	
	public void deleteLineItem(LineItems litem)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(litem);
			t.commit();
			System.out.println("delete lineitem  thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("delete lineitem thất bại!");
		} finally {
			session.close();
		}
	}
	
	public LineItems findLineItem(int p_id, int od_id){
		Session session = factory.getCurrentSession();
		String hql = "FROM LineItems as litem Where litem.product.id = :p_id and litem.orders.id =:od_id";
		Query query = session.createQuery(hql);
		try {
			
			
			query.setParameter("p_id", p_id);
			query.setParameter("od_id", od_id);
			LineItems litem = (LineItems)query.list().get(0);
		}
		catch(Exception e) {
			System.out.println("Lỗi tìm LineItem");
			return null;
		}
		
		session.clear();
		return (LineItems)query.list().get(0);
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
	
	public void updateInfo(Customer customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(customer);
			t.commit();
			System.out.println("edit info  thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("edit info thất bại!");
		} finally {
			session.close();
		}
	}
	

	public void updateOrder(Orders od) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(od);
			t.commit();
			System.out.println("update order  thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("update order thất bại!");
		} finally {
			session.close();
		}
	}
	
	public Orders getOrder(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders as od Where od.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Orders od = (Orders) query.list().get(0);
		session.clear();
		return od;
	}
	
	public Orders createOrder(int id_user) {
		Orders order = new Orders();
		order.setId(0);
		String dateNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateNow);
			order.setDatetime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setStatus(false);
		Session session = factory.getCurrentSession();
		String hql = "From Customer ";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			if (customer.getId() == id_user) {
				order.setCustomer(customer);
			}
		}
		return order;
	}
	
	public void getOrderId(ModelMap model, HttpSession request) {
		int id_user = (Integer) request.getAttribute("curUser");
		int number = 0;
		Session session = factory.getCurrentSession();
		String hql = "From Orders ";
		Query query = session.createQuery(hql);
		List<Orders> orders = query.list();
		for (Orders order : orders) {
			if (order.getCustomer().getId() == id_user && order.isStatus() == false) {
				number = order.getId();				
				request.setAttribute("od_user", order.getId());
			}
		}
		if(number == 0) {
			Orders newOrder = createOrder(id_user);
			InsertOrder(newOrder);
				query = session.createQuery(hql);
				orders = query.list();
				for (Orders order : orders) {
					if (order.getCustomer().getId() == id_user && order.isStatus() == false) { 
						request.setAttribute("od_user", order.getId());
					}
				}

		}
	}
	
	public void InsertOrder(Orders order){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		

		try {
			session.save(order);
			t.commit();
			System.out.println("Tạo order mới thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println("ko tạo đc order mới!");
		} finally {
			session.close();
		}
	}

}
