package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.entity.Orders;
import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping("/admin/orders/")
public class AdminOrdersController {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("index")
	public String Orders(HttpServletRequest request, ModelMap model) {
		String dateStartNow = LocalDate.now().with( TemporalAdjusters.firstDayOfMonth()).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));		
		System.out.println(dateStartNow);
		String dateEndNow =  LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String dateTimeEndNow =  LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));		
		Date dateStart , dateEnd;
		try {
			System.out.println("0");
			dateStart = new SimpleDateFormat("yyyy-MM-dd").parse(dateStartNow);
			
			dateEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTimeEndNow);
			
			List<Orders> orders = this.getOrders(dateStart, dateEnd);

			PagedListHolder pagedListHolder = new PagedListHolder(orders);

			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(3);
			pagedListHolder.setPageSize(6);
			model.addAttribute("pagedListHolder", pagedListHolder);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println("Lỗi Trong phần try catch");
		}
		model.addAttribute("dateStartMonth", dateStartNow);
		model.addAttribute("dateNow", dateEndNow);
		return "admin/orders";
	}
	
	@RequestMapping(value="index", params="search")
	public String loadOrders(HttpServletRequest request, ModelMap model, @PathParam("strDateStart") String strDateStart, @PathParam("strDateEnd") String strDateEnd) {
		String strDateTimeEnd = strDateEnd + " 23:59:59";
		System.out.println(strDateTimeEnd);
		Date dateStart , dateEnd;
		try {
			System.out.println("0");
			dateStart = new SimpleDateFormat("yyyy-MM-dd").parse(strDateStart);
			
			dateEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strDateTimeEnd);
			
			List<Orders> orders = this.getOrders(dateStart, dateEnd);

			PagedListHolder pagedListHolder = new PagedListHolder(orders);

			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(3);
			pagedListHolder.setPageSize(6);
			model.addAttribute("pagedListHolder", pagedListHolder);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println("Lỗi Trong phần try catch");
		}
		model.addAttribute("dateStartMonth", strDateStart);
		model.addAttribute("dateNow", strDateEnd);
		return "admin/orders";
	}
	
	public List<Orders> getOrders(Date dateStart, Date dateEnd){
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders as od where od.total > 0 and od.status = 'true' and od.datetime between :dateStart and :dateEnd";
		Query query = session.createQuery(hql);
		query.setParameter("dateStart", dateStart);
		query.setParameter("dateEnd", dateEnd);
		List<Orders> list = query.list();
		return list;
	}
}
