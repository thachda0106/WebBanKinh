
package ptithcm.controller;






import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Mailer;
import ptithcm.entity.Customer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional

public class RegisterController {

	@Autowired
	Mailer mailer;
	
	@Autowired
	SessionFactory factory;

	@RequestMapping("/registerC")
	public String user(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("address") String address,
			@RequestParam("phone") String phone,
			@RequestParam("email") String email, ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "From UserAccount";
		Query query = session.createQuery(hql);
		List<UserAccount> users = query.list();
		
		for (UserAccount user : users) {
			if(user.getUsername().equals(username)) {
				model.addAttribute("alert","Tên đăng nhập đã tồn tại");	
				return "/login";
				
			}else if(user.getCustomer().getEmail().equals(email)) {
				model.addAttribute("alert","Email đã được sử dụng. Vui lòng chọn email khác");	
				return "/login";
			}
		}
		Customer newCustomer = new Customer(name, address, phone, email,"");
		UserAccount newAccount = new UserAccount(username, password, false, newCustomer);
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(newCustomer);
			session.save(newAccount);
			transaction.commit();
			model.addAttribute("alert","Tạo tài khoản thành công. Đăng nhập ngay nào!");
			System.out.println("ok");
		} catch (Exception e) {
			transaction.rollback();
		}finally {
			session.close();
		}
		try {
			String message = "Chào mừng bạn đến với XXSTORE. \nCảm ơn bạn đã ủng hộ cửa hàng của chúng tôi";
			String tittle = "Tạo tài khoản thành công";
			mailer.send(email, tittle , message);
			
		}
		catch(Exception ex) {
			
		}
		
		return "/login";
	}	
}
