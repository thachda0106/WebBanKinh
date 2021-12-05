package ptithcm.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadAvatar;
import ptithcm.bean.UploadImage;
import ptithcm.entity.Customer;
import ptithcm.entity.UserAccount;

@Controller
@Transactional
public class ProfileEditController {

	@Autowired
	SessionFactory factory;

	@Autowired
	@Qualifier("uploadavatar")
	UploadAvatar uploadAvatar;
	
	@RequestMapping(value="/profile-edit", method = RequestMethod.POST)
	public String profileEdit(ModelMap model, HttpSession request) {

		UserAccount user = this.getUser((Integer) (request.getAttribute("curUser")));

		model.addAttribute("name", user.getCustomer().getName());
		model.addAttribute("email", user.getCustomer().getEmail());
		model.addAttribute("phone", user.getCustomer().getPhone());
		model.addAttribute("address", user.getCustomer().getAddress());
		model.addAttribute("useravatar", user.getCustomer().getAvatar());
		model.addAttribute("username", user.getUsername());
		model.addAttribute("password", user.getPassword());
		model.addAttribute("password1", user.getPassword());

		return "editProfile";
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST )
	public String user( @RequestParam("avatar") MultipartFile avatar, @RequestParam("password") String password,@RequestParam("password1") String password1, @RequestParam("name") String name,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("email") String email, HttpSession request, ModelMap model) {
		
		int id = (Integer) request.getAttribute("curUser");
		UserAccount user = getUser(id);
		String avatarName =  user.getCustomer().getAvatar();
		if (!avatar.isEmpty()) {
			try {

				avatarName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyHHmmss-")) +user.getUsername() + avatar.getOriginalFilename();
				String photoPath = uploadAvatar.basePath + File.separator + avatarName;
				avatar.transferTo(new File(photoPath));    
			} catch (Exception e) {
				model.addAttribute("message","Thêm ảnh không thành công!");
				return "/editProfile";
			}
		}
		

		Customer customer = new Customer(id, name, address, phone, email, avatarName);
		user.setPassword(password);
		user.setCustomer(customer);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {

			session.update(user);
			session.update(customer);
			transaction.commit();

			System.out.println("ok");
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}



		return "redirect:/profile.htm";

	}
	

	public UserAccount getUser(int id) {

		Session session = factory.getCurrentSession();
		String hql = "From UserAccount as us where us.customer.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		UserAccount user = (UserAccount)query.list().get(0);
		return user;
	}
	
}