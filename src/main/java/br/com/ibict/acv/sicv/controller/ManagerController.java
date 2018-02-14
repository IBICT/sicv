package br.com.ibict.acv.sicv.controller;

import static br.com.ibict.acv.sicv.controller.HomeController.session;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ibict.acv.sicv.model.Archive;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.QualiData;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.TechnicalReviewer;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.ArchiveDao;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.QualiDataDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import java.io.File;
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
    public String itemDetail(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            model.put("localN", 3);
            model.put("isUserLabel", true);
            model.put("name", name);
            Ilcd ilcd = ilcdDao.findOne(id);
            model.put("local", "Gestor > <u>" + ilcd.getTitle() + "</u>");
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

    @RequestMapping(value = {"/{id}/invite/{status}", "{id}/invite/{status}", "/{id}/invite/{status}/", "{id}/invite/{status}/"}, method = RequestMethod.GET)
    public String invite(Map<String, Object> model, @PathVariable("id") Long id, @PathVariable("status") Long statusId) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("localN", 3);
        model.put("isUserLabel", true);
        model.put("name", name);
        Ilcd ilcd = ilcdDao.findOne(id);
        model.put("local", "Gestor > <u>" + ilcd.getTitle() + "</u>");
        model.put("ilcd", ilcd);
        Status status = statusDao.findOne(statusId);
        model.put("status", status);
        List<User> users = userDao.findAll();
        model.put("users", users);
        return "manager/invite";
    }

    @RequestMapping(value = "/{ilcd}/invite/{status}", method = RequestMethod.POST)
    public String invite(@RequestParam("user") Long userID, @PathVariable("ilcd") Long ilcdId, @PathVariable("status") Long statusId, @RequestParam("tipo") Integer tipo) {

        User user = userDao.findOne(userID);
        Ilcd ilcd = ilcdDao.findById(ilcdId);

        Status statusOld = statusDao.findOne(statusId);
        statusOld.setClosed(Boolean.TRUE);

        Status status = new Status();
        status.setIlcd(ilcd);

        Archive archive = new Archive();
        archive.setPathFile(statusOld.getArchive().getPathFile());
        archiveDao.save(archive);

        status.setArchive(archive);
        status.setRevisor(user);
        status.setType(tipo);
        status.setRequestDate(new Date());
        status.setPrevious(statusOld);
        statusDao.save(status);

        archive.setStatus(status);
        archiveDao.save(archive);

        ilcd.addStatus(status);
        ilcdDao.save(ilcd);

        Homologacao homologacao = ilcd.getHomologation();
        homologacao.setUser(((User) session().getAttribute("user")));
        homologacao.setStatus(tipo > 2 ? 3 : 2);
        homologacaoDao.save(homologacao);

        statusDao.save(statusOld);

        return "redirect:/gestor/";
    }

    @RequestMapping(value = {"/{ilcd}/sendauthor/{status}", "{ilcd}/sendauthor/{status}", "/{ilcd}/sendauthor/{status}/", "{ilcd}/sendauthor/{status}/"}, method = RequestMethod.GET)
    public String sendAuthor(@PathVariable("ilcd") Long ilcdID, @PathVariable("status") Long statusID) {

        Ilcd ilcd = ilcdDao.findById(ilcdID);

        Status oldStatus = statusDao.findOne(statusID);
        oldStatus.setClosed2(Boolean.TRUE);
        statusDao.save(oldStatus);

        Status status = new Status();
        status.setIlcd(ilcd);
        status.setType(3);
        status.setRevisor(ilcd.getUser());
        status.setRequestDate(new Date());
        status.setPrevious(oldStatus);
        statusDao.save(status);

        ilcd.addStatus(status);
        ilcdDao.save(ilcd);

        return "redirect:/gestor/" + ilcdID;
    }

    @RequestMapping(value = {"/{ilcd}/nextstep/", "{ilcd}/nextstep/", "/{ilcd}/nextstep", "{ilcd}/nextstep"}, method = RequestMethod.POST)
    public String nextStep(@PathVariable("ilcd") Long ilcdID, @RequestParam("status") Long statusID) {

        Ilcd ilcd = ilcdDao.findById(ilcdID);
        Status oldStatus = statusDao.findOne(statusID);
        File f = new File(Strings.UPLOADED_FOLDER + "/" + oldStatus.getArchive().getPathFile() + "/review.zip");

        oldStatus.setClosed2(Boolean.TRUE);
        statusDao.save(oldStatus);
        Archive archive = new Archive();
        archive.setPathFile(oldStatus.getArchive().getPathFile());
        Status status = new Status();
        status.setIlcd(ilcd);
        status.setArchive(archive);
        status.setPrevious(oldStatus);
        
        if (f.exists()) {
            status.setType(4);
        } else {

            status.setType(2);
        }
        
        statusDao.save(status);

        archive.setStatus(status);
        archiveDao.save(archive);

        Homologacao homologacao = ilcd.getHomologation();
        homologacao.setUser(((User) session().getAttribute("user")));
        homologacao.setStatus(3);
        homologacaoDao.save(homologacao);

        session().setAttribute("nextStep", true);

        return "redirect:/gestor/" + ilcdID;
    }

    @RequestMapping(value = {"/{ilcd}/review/quality/{status}/", "{ilcd}/review/quality/{status}/", "/{ilcd}/review/quality/{status}", "{ilcd}/review/quality/{status}"}, method = RequestMethod.GET)
    public String qualityReviewView(Map<String, Object> model, @PathVariable("ilcd") Long ilcdId, @PathVariable("status") Long statusId) {
        try {
            User user = (User) session().getAttribute("user");
            Status status = statusDao.findOne(statusId);
            QualiData qualiData = status.getQualiData();
            model.put("qualiData", qualiData);
            return "manager/qualityreview";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{ilcd}/review/technical/{status}/", "{ilcd}/review/technical/{status}/", "/{ilcd}/review/technical/{status}", "{ilcd}/review/technical/{status}"}, method = RequestMethod.GET)
    public String technicReviewView(Map<String, Object> model, @PathVariable("ilcd") Long ilcdId, @PathVariable("status") Long statusId) {
        try {
            User user = (User) session().getAttribute("user");
            Status status = statusDao.findOne(statusId);
            TechnicalReviewer technicalReviewer = status.getTechnicalReviewer();
            model.put("status", status);
            model.put("technicalReviewer", technicalReviewer);
            return "manager/technicalreview";
        } catch (Exception e) {
            return "error";
        }
    }

}
