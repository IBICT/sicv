package br.com.ibict.acv.sicv;

import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping("/ilcd")
public class AdminController {


    @RequestMapping("/admins")
    public String root(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "home/home";
        }        
    }
    
    @PostMapping("/admins/login")
    @ResponseBody
    public String loginHandle(@RequestParam("email") String email, @RequestParam("password") String senha) {
        User user = userDao.findByEmail(email);
        if (user == null) {
            return new Gson().toJson(false);
        } else {
            session().setAttribute("user", user);
            return new Gson().toJson(true);
        }
    }
    
    @RequestMapping("/teste2")
    @ResponseBody
    public String teste() {
        List<User> user = userDao.findAll();
        return new Gson().toJson(user);
    }
    
    public static HttpSession session() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }

    @Autowired
    private UserDao userDao;
    
}
