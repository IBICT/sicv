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
import br.com.ibict.acv.sicv.model.Archive;
import br.com.ibict.acv.sicv.model.QualiData;

import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.QualiDataDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.repositories.ArchiveDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.sicv.enums.EnumProfile;
import java.util.Collections;
import java.util.Date;
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
    private QualiDataDao qualiDataDao;

    @Autowired
    private ArchiveDao archiveDao;

    @Autowired
    private Mail mail;

    @PostConstruct()
    public void buildLists() {
    }

    @RequestMapping(value = {"", "/"})
    public String getRoot(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("local", "Gestor");
        model.put("localN", 3);
        model.put("isUserLabel", true);
        model.put("name", name);
        List<User> users = userDao.findAll();
        List<Ilcd> ilcds = ilcdDao.findAll();
        model.put("users", users);
        model.put("ilcds", ilcds);

        return "manager/index";
    }

    @RequestMapping(value = {"/{id}/", "{id}/", "{id}", "/{id}"})
    public String itemDeteil(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            model.put("localN", 3);
            model.put("isUserLabel", true);
            model.put("name", name);
            Ilcd ilcd = ilcdDao.findOne(id);
            model.put("local", "Gestor > <u>" + ilcd.getName() + "</u>");
            model.put("ilcd", ilcd);
            List<Status> status = statusDao.findByIlcd(ilcd);
            Collections.reverse(status);
            model.put("status", status);
            List<User> users = userDao.findAll();
            model.put("users", users);

            return "manager/item";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/invite", method = RequestMethod.POST)
    public String invite(@RequestParam("user") Long userID, @RequestParam("ilcd") Long ilcdID, @RequestParam("tipo") Integer tipo) {

        User user = userDao.findOne(userID);
        Ilcd ilcd = ilcdDao.findById(ilcdID);
        Homologacao homologacao = ilcd.getHomologation();
        homologacao.setUser(user);
        homologacao.setStatus(2);
        homologacaoDao.save(homologacao);

        Status status = new Status();
        status.setIlcd(ilcd);
        status.setArchive(homologacao.getLastArchive());
        status.setRevisor(user);
        status.setType(tipo);
        status.setEndDate(new Date());
        status.setExpectedDate(new Date());
        status.setRequestDate(new Date());
        //Status status = homologacao.getLastArchive().getStatus();
        //status.setStatus(2);
        //status.setType(1);
        statusDao.save(status);
        Archive archive = homologacao.getLastArchive();
        archive.setStatus(status);
        archiveDao.save(archive);

        return "redirect:/gestor/";
    }

}
