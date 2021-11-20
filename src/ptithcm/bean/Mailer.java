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
	
	public void send(String email) {
		try {
			String mailBody = "Mật khẩu của bạn đã được đặt lại thành 12345, bạn có thể sửa lại mật khẩu trong profile.";
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail,true,"utf-8");
			helper.setFrom("laptrinhweb010@gmail.com", "Cửa hàng mắt kính HTT");
			helper.setTo(email);
			helper.setReplyTo("laptrinhweb010@gmail.com");
			helper.setSubject("Đặt lại mật khẩu");
			helper.setText(mailBody);
			
			mailer.send(mail);
		}
		catch(Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}
