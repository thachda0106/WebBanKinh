package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class News {
	@RequestMapping("/news")
	String newsPage() {
		return "news";
	}
}
