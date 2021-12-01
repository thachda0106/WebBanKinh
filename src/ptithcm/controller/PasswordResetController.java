package ptithcm.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Mailer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional
public class PasswordResetController {
	@Autowired
	Mailer mailer;
	
	@Autowired
	SessionFactory factory;

	
	@RequestMapping("/resetPass")
	public String resetPass() {
		return "resetPassword";
	}
	
	@RequestMapping("/reset-password")
	public String mailer(ModelMap model,
			@RequestParam("username") String username) {
		Session session = factory.getCurrentSession();
		String hql = "From UserAccount";
		Query query = session.createQuery(hql);
		List<UserAccount> users = query.list();
		for (UserAccount user : users) {
			if(user.getUsername().equals(username)) {
				try {
					String message = "Mật khẩu cũ của bạn là: " + user.getPassword() + "\nBạn có thể đổi lại mật khẩu mới trong Trang cá nhân."
							+ "\nCảm ơn bạn đã ủng hộ cửa hàng.";
					String tittle = "Lấy lại mật khẩu cũ";
					mailer.send(user.getCustomer().getEmail(), tittle, message);
					model.addAttribute("message","Gửi email thành công. Vui lòng kiểm tra email bạn đã đăng ký để lấy lại mật khẩu.");
				}
				catch(Exception ex) {
					
				}
			}else {
				model.addAttribute("message","Tài khoản bạn nhập vào không tồn tại");
			}
		}
		
		
		return "resetPassword";
	}
}