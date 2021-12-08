package ptithcm.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StoreSystemController {
	
	@RequestMapping("/store-system")
	public String home() {
		return "/storesystem";
	}
	

}


