package br.com.ibict.acv.sicv.controller;

import static br.com.ibict.acv.sicv.controller.HomeController.hasSubmitOrStatus;
import static br.com.ibict.acv.sicv.controller.HomeController.ilcds;
import static br.com.ibict.acv.sicv.controller.HomeController.session;
import br.com.ibict.acv.sicv.model.Homologacao;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.SerializationUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;

import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.sicv.enums.EnumProfile;
import org.springframework.web.bind.annotation.PostMapping;
import resources.Strings;

@Controller
@RequestMapping("/gestor")
public class ManagerController {
	    
    //@Autowired
    //private UserDao ilcdsDao;
    
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private IlcdDao ilcdDao;
    
    @Autowired
    private NotificationDao notificationDao;
    
    @Autowired
    private StatusDao statusDao;
    
    @Autowired
    private HomologacaoDao homologacaoDao;
    
    @Autowired
    private Mail mail;
	
    @PostConstruct()
    public void buildLists(){
    }
    
    //HomeController.session()
    @RequestMapping("/")
    public String getRoot(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getUserName();
        model.put("username", name);
        List<User> users = userDao.findAll();
        List<Ilcd> ilcds = ilcdDao.findAll();
        model.put("users", users);
        model.put("ilcds", ilcds);
        
        return "manager/index";
    }
    
    @RequestMapping("/authorIlcd/{index}")
    public String getAuthorIlcd(ModelMap model, @PathVariable("index") Integer index) {
    	Ilcd ilcd = HomeController.ilcds.get(index);
    	List<User> users = userDao.findAll();
    	model.put("ilcd", ilcd);
    	model.put("users", users);
        return "manager/index";

    }
    
    @RequestMapping(value = "/invite", method = RequestMethod.POST)
    @ResponseBody
    public String invite(@RequestParam("user") Long userID, @RequestParam("ilcd") Long ilcdID){
        
       // User user = userDao.findOne(user);
        
        //List<Ilcd> ilcd = ilcdDao.;
        //Ilcd ilcd = 
        User user = userDao.findOne(userID);
        Ilcd ilcd = ilcdDao.findById(ilcdID);
        Homologacao homologacao = ilcd.getHomologation();
        homologacao.setUser(user);
        homologacaoDao.save(homologacao);
        Status status = homologacao.getLastArchive().getStatus();
        status.setStatus(2);
        status.setType(1);
        statusDao.save(status);
        
        
        return "teste";
    }
    
    @RequestMapping("/invite-quality-review")
    public String teste(@RequestParam("user") Long userID, @RequestParam("ilcd") Long ilcdID) {
        
        User user = userDao.findOne(userID);
        Ilcd ilcd = ilcdDao.findById(ilcdID);
        
        Status status = new Status( ilcd.getHomologation().getLastArchive().getStatus() );
        status.setRevisor(user);
        status.setType(2);
        status.setStatus(2);
        status.setIlcd(ilcd);
        Notification notify = new Notification();
        notify.setUser( user.getId() );
        notify.fillMsgWAIT_AC( ilcd.getUuid() , ilcd.getName() );
        notify.setStatus(status);
        notify.setIlcd(ilcd);
        notify.setNotifyDate( Calendar.getInstance().getTime() );
        status.setNotify(notify);
        ilcd.addStatus(status);
        ilcd.addNotification(notify);

        
        try {
        	statusDao.save(status);
        	ilcdDao.saveAndFlush(ilcd);
        	
        	Map<String, Object> model = new HashMap<String, Object>();
            model.put("ilcdName", ilcd.getName());
            //TODO create field date in ilcd table to retrieve date that ilcd was sent.
            model.put("date", notify.getNotifyDate());
            model.put("ilcdUser", user);
            model.put("urlTrack", Strings.BASE+"notifications");
            model.put("url", Strings.BASE);
            //model.put("goal",);
            HomeController.hasSubmitOrStatus = true;
        	mail.sendEmail(user.getEmail(), RegisterController.EMAIL_ADMIN, "Submissão de Inventário", model, "emailSubmissionToQualityReviewer.ftl");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        return "true";
    }
    
    @RequestMapping(value = "/quality-review.json", method = RequestMethod.GET)
    @ResponseBody
    String getRevisorQuilidade() {
        Iterable<User> users;
        try {
            users = userDao.findByPerfil(EnumProfile.QUALITY_REVIEWER.name());
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(users);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }
    
/*    @RequestMapping(value = "/users.json", method = RequestMethod.GET)
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
*/    
	
}
