package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
    
    @Autowired
    private UserDao userDao;
    
    @RequestMapping("/")
    public String root(Map<String, Object> model) {
        return "home/home";
    }
    
    @PostMapping("/login")
    @ResponseBody
    public String login(
            @RequestParam("email") String email,
            @RequestParam("senha") String senha) {
        User user = userDao.findByEmail(email);
        if (user.getPasswordHash().equals(new Sha512Hash(senha, user.getPasswordHashSalt(), 5).toHex())) {
            session().setAttribute("user", user);
            return new Gson().toJson(user);
        } else {
            return new Gson().toJson(false);
        }
        
    }
    
    public static HttpSession session() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }
    
}
