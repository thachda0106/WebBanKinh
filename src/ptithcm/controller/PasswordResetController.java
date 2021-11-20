package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Mailer;

@Controller
public class PasswordResetController {
	@Autowired
	Mailer mailer;
	@RequestMapping("/resetPass")
	public String resetPass() {
		return "resetPassword";
	}
	
	@RequestMapping("/reset-password")
	public String mailer(ModelMap model,
			@RequestParam("email") String email) {
		try {
			mailer.send(email);
			model.addAttribute("message","Gửi email thành công!");
		}
		catch(Exception ex) {
			
		}
		return "resetPassword";
	}
}



