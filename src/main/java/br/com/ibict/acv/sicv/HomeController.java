package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    
    @RequestMapping("/")
    public String root(Map<String, Object> model) {
        return "home/home";
    }
    
    @RequestMapping("/register")
    public String register(Map<String, Object> model) {
        return "register/register";
    }
    
}
