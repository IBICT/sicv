package br.com.ibict.acv.sicv.controller;

import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import static br.com.ibict.acv.sicv.controller.AdminController.session;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author deivdy
 */

@Controller
public class NotificationController {
    
    @Autowired
    private NotificationDao notificationDao;
    
    @RequestMapping("/notification.json")
    @ResponseBody
    public String root(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "[]";
        } else {
            User user = (User) session().getAttribute("user");
            List<Notification> list = notificationDao.findByUser(user.getId());
            return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(list);
        }
    }
    
}
