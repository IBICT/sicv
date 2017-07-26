package br.com.ibict.acv.sicv.controller;

import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import static br.com.ibict.acv.sicv.controller.AdminController.session;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author deivdy
 */

@Controller
@RequestMapping("/admin/users")
public class UsersController {
    
    @Autowired
    private UserDao userDao;
    
    @RequestMapping("/")
    public String index(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "admin/list";
        }        
    
    }
    
    @RequestMapping(value = "/users.json", method = RequestMethod.GET)
    @ResponseBody
    String getJSON() {
        Iterable<User> users;
        try {
            users = userDao.findAll();
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(users);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }
    
    @PostMapping("/setperfil")
    @ResponseBody
    public String loginHandle(@RequestParam("id") Long id, @RequestParam("perfil") String perfil) {
        
        User user = userDao.findOne(id);
        user.setPerfil(perfil);
        userDao.save(user);
        
        return "true";
    }
    
}
