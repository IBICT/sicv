package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import br.com.ibict.acv.sicv.model.User;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/register")
public class RegisterController {
    
    @RequestMapping(value = { "*" })
    public String index() {
        return "register/register";
    }
    
    @PostMapping(value = { "","/" })
    @ResponseBody
    public String register(@RequestParam("json") String json) {
        return json;
    }
    
}
