package ptithcm.bean;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class Mailer {
	@Autowired
	JavaMailSender mailer;
	
	public void send(String email, String tittle, String message) {
		try {
			
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail,true,"utf-8");
			helper.setFrom("laptrinhweb010@gmail.com", "Cửa hàng mắt kính XXSTORE");
			helper.setTo(email);
			helper.setReplyTo("laptrinhweb010@gmail.com");
			helper.setSubject(tittle);
			helper.setText(message);
			
			mailer.send(mail);
		}
		catch(Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}