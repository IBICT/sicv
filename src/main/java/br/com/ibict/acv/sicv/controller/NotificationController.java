package br.com.ibict.acv.sicv.controller;

import static br.com.ibict.acv.sicv.controller.AdminController.session;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.gson.GsonBuilder;

import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.UserDao;

/**
 *
 * @author deivdy
 */
@Controller
public class NotificationController {
    
    @Autowired
    private UserDao userDao;
	
    @Autowired
    private NotificationDao notificationDao;
    
    @RequestMapping("/notification.json")
    @ResponseBody
    public String root(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "[]";
        } else {
            User user = (User) session().getAttribute("user");
            List<Notification> list = notificationDao.findByIdUser(user.getId());
            return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(list);
        }
    }

    @RequestMapping("/notifications")
    public String notifications(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            User user = (User) session().getAttribute("user");
            model.put("user", user);
            List<Notification> notifications = notificationDao.findByIdUser(user.getId());
            model.put("notifications", notifications);
//            model.put("notifications", new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(notifications));
            return "notifications";
        }
    }
    
    @RequestMapping(value = "/notifications/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public void notifications(Map<String, Object> model, @PathVariable("id") Long idNotify ) {
        if (session().getAttribute("user") == null) {
        } else {
            User user = (User) session().getAttribute("user");
            if(user.getQntdNotificacoes() > 0)
            	user.setQntdNotificacoes(user.getQntdNotificacoes()-1);
            model.put("user", user);
            Notification notification = notificationDao.findOne(idNotify);
            userDao.save(user);
            notification.setVisualized(true);
            notificationDao.save(notification);
        }
    }
    
/*    @RequestMapping("/notification.json")
    @ResponseBody
    public String notification() {
        User user = (User) session().getAttribute("user");
        System.out.println(user.getEmail());
        List<Ilcd> ilcds = ilcdDao.findAll();
        for (Iterator<Ilcd> iterator = ilcds.iterator(); iterator.hasNext();) {
            Ilcd ilcd = iterator.next();
            if (ilcd.getHomologacao() != null) {
                if (ilcd.getHomologacao().getUser().getId().equals(user.getId()) && ilcd.getHomologacao().getStatus() == 1) {
                    System.out.println("OK");
                } else {
                    iterator.remove();
                }
            } else {
                iterator.remove();
            }
        }
        String retorno = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(ilcds);
        retorno = retorno.substring(0, retorno.length());
        return "{ \"data\" : " + retorno + " }";
    }*/

}
