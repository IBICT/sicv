package br.com.ibict.acv.sicv.controller;

import static br.com.ibict.acv.sicv.controller.HomeController.session;

import java.io.File;
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
import br.com.ibict.acv.sicv.model.Notification;
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
        Notification notifyQ = new Notification();

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

        notifyQ.setUser(user);
        if (tipo == 1) {
            notifyQ.fillMsgQUALITY_WAIT_AC(status.getId(), ilcd.getTitle());
        } else {
            notifyQ.fillMsgTECHNICAL_WAIT_AC(status.getId(), ilcd.getTitle());
        }
        user.setQntdNotificacoes(user.getQntdNotificacoes() + 1);
        user.addNotification(notifyQ);
        //notificationDao.save(notifyQ);
        userDao.save(user);

        return "redirect:/gestor/";
    }

    @RequestMapping(value = {"{ilcd}/invitecancel/{id}/", "/{ilcd}/invitecancel/{id}/", "{ilcd}/invitecancel/{id}", "/{ilcd}/invitecancel/{id}"}, method = RequestMethod.GET)
    public String inviteCancel(Map<String, Object> model, @PathVariable("id") Long id) {

        Status status = statusDao.findOne(id);
        status.setCancelInvite(Boolean.TRUE);
        statusDao.save(status);

        Status statusOld = status.getPrevious();
        statusOld.setClosed(false);
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
        User user = ilcd.getUser();
        Notification notifyUser = new Notification();
        notifyUser.setUser(user);
        if (oldStatus.getType() == 1) {
            notifyUser.fillMsgUSER_MANAGER_REV_Q_NEEDADJUST(ilcdID, status.getPrevious().getId());
        } else {
            notifyUser.fillMsgUSER_MANAGER_REV_T_NEEDADJUST(ilcdID);
        }
        user.addNotification(notifyUser);
        user.setQntdNotificacoes(user.getQntdNotificacoes() + 1);
        userDao.save(user);

        return "redirect:/gestor/" + ilcdID;
    }

    /**
     * Method to final approved by manager
     *
     */
    @RequestMapping(value = {"/{ilcd}/nextstep/", "{ilcd}/nextstep/", "/{ilcd}/nextstep", "{ilcd}/nextstep"}, method = RequestMethod.POST)
    public String nextStep(@PathVariable("ilcd") Long ilcdID, @RequestParam("status") Long statusID) {

        Notification notify = new Notification();
        Ilcd ilcd = ilcdDao.findById(ilcdID);
        User user = ilcd.getUser();
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
        notify.setUser(user);

        List<User> managers = userDao.findByPerfil("MANAGER");

        if (f.exists()) {
            status.setType(4);
            status.setRevisor(user);
            notify.fillMsgUSER_MANAGER_APPROVED();
            user.addNotification(notify);
            user.setQntdNotificacoes(user.getQntdNotificacoes() + 1);
            for (User manager : managers) {
                Notification notifyManager = new Notification();
                notifyManager.setUser(manager);
                manager.addNotification(notifyManager);
                manager.setQntdNotificacoes(manager.getQntdNotificacoes() + 1);
                notifyManager.fillMsgMANAGER_APPROVED(status.getIlcd().getName(), ilcdID);
                userDao.saveAndFlush(manager);
            }

        } else {
            status.setType(2);
            notify.fillMsgUSER_MANAGER_REV_Q_APPROVED(ilcd.getId());
            user.addNotification(notify);
            user.setQntdNotificacoes(user.getQntdNotificacoes() + 1);
            for (User manager : managers) {
                Notification notifyManager = new Notification();
                notifyManager.setUser(manager);
                manager.addNotification(notifyManager);
                manager.setQntdNotificacoes(manager.getQntdNotificacoes() + 1);
                notifyManager.fillMsgMANAGER_REV_Q_APPROVED(ilcd.getTitle(), status.getId(), ilcdID);
                userDao.saveAndFlush(manager);
            }
        }

        userDao.save(user);
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

    @RequestMapping(value = {"/{ilcd}/disagree-return"}, method = RequestMethod.POST)
    public String complexForm(Map<String, Object> model, @PathVariable("ilcd") Long ilcdId, Long statusID, Integer action) {
        String retorno = "";
        User user = (User) session().getAttribute("user");
        Status status = statusDao.findOne(statusID);
        status.setClosed2(Boolean.TRUE);
        Status newStatus;
        Archive archive;
        switch (action) {
            case 1:
                // Aprovar
                archive = new Archive();
                archive.setHomologation(status.getArchive().getHomologation());
                archive.setPathFile(status.getArchive().getPathFile());
                
                newStatus = new Status();
                newStatus.setAccept(Boolean.TRUE);
                newStatus.setResult(1);
                newStatus.setClosed(Boolean.TRUE);
                newStatus.setClosed2(Boolean.TRUE);
                newStatus.setRevisor(user);
                newStatus.setArchive(archive);
                
                statusDao.save(newStatus);
                archiveDao.save(archive);
                break;
            case 2:
                //Nova Revisão
                
                archive = new Archive();
                archive.setHomologation(status.getArchive().getHomologation());
                archive.setPathFile(status.getArchive().getPathFile());
                
                newStatus = new Status();
                newStatus.setRevisor(status.getRevisor());
                newStatus.setType(status.getType());
                newStatus.setArchive(null);
                newStatus.setIlcd(status.getIlcd());
                newStatus.setArchive(archive);
                
                statusDao.save(newStatus);
                archiveDao.save(archive);
                break;
            case 3:
                //Novo Revisor
                retorno = "redirect:/gestor/"+ilcdId+"/invite/"+statusID+"/?type="+status.getType();
                break;
            case 4:
                //Reprovar
                
                archive = new Archive();
                archive.setHomologation(status.getArchive().getHomologation());
                archive.setPathFile(status.getArchive().getPathFile());
                
                newStatus = new Status();
                newStatus.setAccept(Boolean.TRUE);
                newStatus.setResult(3);
                newStatus.setClosed(Boolean.TRUE);
                newStatus.setClosed2(Boolean.TRUE);
                newStatus.setRevisor(user);
                newStatus.setArchive(archive);
                
                statusDao.save(newStatus);
                archiveDao.save(archive);
                break;
            default:
                //Operação invalida
                break;
        }
        return retorno;
    }

}
