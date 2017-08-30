package br.com.ibict.acv.sicv.controller;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.TechnicalReviewer;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.TechnicalReviewerDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.sicv.enums.EnumProfile;
import resources.Strings;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/")
    public String root(Map<String, Object> model, Principal principal) {
        if (principal == null) {
            return "/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "admin/home";
        }
    }

    @PostMapping("/login")
    //@ResponseBody
    public String loginHandle(@RequestParam("email") String email, @RequestParam("password") String senha) {
        User user = userDao.findByEmail(email);
        if (user == null) {
            //return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(false);
            return "redirect:/admin/login";
        } else {
            session().setAttribute("user", user);
            //return new Gson().toJson(true);
            return "redirect:/admin/";
        }
    }

    @RequestMapping("/notifications")
    public String notifications(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            User user = (User) session().getAttribute("user");
            model.put("user", user);
            List<Notification> notifications = notificationDao.findByUser(user.getId());
            model.put("notifications", new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(notifications));
            return "admin/notifications";
        }
    }

    @RequestMapping("/solicitacoes")
    public String solicitacoes(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "admin/solicitacoes";
        }
    }

    @RequestMapping("/homologacao/{id}/accept")
    public String homologacaoAccept(Map<String, Object> model, @PathVariable("id") String id) {
        try {
            User user = (User) session().getAttribute("user");
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();
            homologacao.setStatus(2);
            homologacaoDao.save(homologacao);
            return "redirect:/admin/homologacao/" + id;
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/homologacao/{id}", method = RequestMethod.GET)
    public String homologacao(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("ilcd", ilcd);
            return "admin/homologacao";
        }
    }

    @RequestMapping(value = "/homologacao/{id}/qualidata", method = RequestMethod.GET)
    public String qualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("id", id);
            model.put("user", session().getAttribute("user"));
            return "admin/qualidata";
        }
    }

    @RequestMapping(value = "/homologacao/{id}/qualidata", method = RequestMethod.POST)
    @ResponseBody
    public String qualidataAction(Map<String, Object> model, @PathVariable("id") String id, @RequestParam("json") String json) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {

            System.out.println(id);
            System.out.println(json);

            Ilcd ilcd = ilcdDao.findById(id);
            ilcd.getHomologacao().setStatus(3);
            ilcd.setJson1(json);
            try {
            	ilcdDao.save(ilcd);
            	User ilcdUser = ilcd.getUser();
            	User user = (User) session().getAttribute("user");
            	
                Map<String, Object> emailModel = new HashMap<String, Object>();
                emailModel.put("ilcdName", ilcd.getName());
                emailModel.put("date", RegisterController.getDateString());
                emailModel.put("ilcdUser", ilcdUser);
                emailModel.put("reviewer", user);
                emailModel.put("url", Strings.BASE);
                String subject = "Revisão de Qualidade de Inventário";
                Mail mail = RegisterController.getMailUtil();
                
            	mail.sendEmail(RegisterController.EMAIL_ADMIN, RegisterController.EMAIL_ADMIN, subject, emailModel, "emailReviewCompleted.ftl");
				
			} catch (Exception e) {
				// TODO: handle exception
			}

            model.put("user", session().getAttribute("user"));
            return "admin/qualidata";
        }
    }

    @RequestMapping(value = "/homologacao/{id}/parecer", method = RequestMethod.GET)
    //@ResponseBody
    public String parecerQualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("json", new Gson().toJson(ilcd));

            return "admin/parecer";
        }
    }

    @RequestMapping(value = "/homologacao/{id}/aprovarqualidata", method = RequestMethod.GET)
    public String AprovarQualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));

            Ilcd ilcd = ilcdDao.findById(id);
            ilcd.getHomologacao().setStatus(4);
            ilcdDao.save(ilcd);
            model.put("ilcd", ilcd);
            return "admin/aprovarqualidata";
        }
    }

    @RequestMapping(value = "/homologacao/{id}/reprovarqualidata", method = RequestMethod.GET)
    @ResponseBody
    public String ReprovarQualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));

            Ilcd ilcd = ilcdDao.findById(id);
            ilcd.getHomologacao().setStatus(9);
            ilcdDao.save(ilcd);
            return "reprovarqualidata";
        }
    }

    @RequestMapping("/technicalreviewer/{id}")
    public String technicalReviewer(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("ilcd", ilcd);
//            return "admin/invitetechnicalreviewer";

            return "admin/technicalreviewer";
        }
    }

    @RequestMapping("/technicalreviewer/{id}/accept")
    public String technicalReviewerAccept(Map<String, Object> model, @PathVariable("id") String id) {
        try {
            User user = (User) session().getAttribute("user");
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();
            homologacao.setStatus(6);
            homologacao.setUser(user);
            homologacaoDao.save(homologacao);
            return "redirect:/admin/technicalreviewer/" + id;
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("/technicalreviewer/{id}/refused")
    public String technicalReviewerRefused(Map<String, Object> model, @PathVariable("id") String id) {
        try {
            User user = (User) session().getAttribute("user");
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();
            homologacao.setStatus(9);
            homologacaoDao.save(homologacao);
            return "redirect:/admin/";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("technicalreviewer/{id}/technicalreviewerform")
    public String technicalReviewerForm(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("ilcd", id);
//            return "admin/invitetechnicalreviewer";

            return "admin/technicalreviewerform";
        }
    }

    @PostMapping("technicalreviewer/{id}/technicalreviewerform")
    @ResponseBody
    public String technicalReviewerFormAction(Map<String, Object> model, @PathVariable("id") String id, @RequestParam("comment") String comment) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            User user = (User) session().getAttribute("user");
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();

            try {
                TechnicalReviewer technicalReviewer = new TechnicalReviewer(null, comment, ilcd.getId(), user);
                technicalReviewerDao.save(technicalReviewer);
                homologacao.setTechnicalReviewer(technicalReviewer);
                homologacao.setStatus(7);
                
            	User ilcdUser = ilcd.getUser();
            	
                Map<String, Object> emailModel = new HashMap<String, Object>();
                emailModel.put("ilcdName", ilcd.getName());
                emailModel.put("date", RegisterController.getDateString());
                emailModel.put("ilcdUser", ilcdUser);
                emailModel.put("reviewer", user);
                emailModel.put("url", Strings.BASE);
                String subject = "Revisão Técnica de Inventário";
                Mail mail = RegisterController.getMailUtil();
                
            	mail.sendEmail(RegisterController.EMAIL_ADMIN, RegisterController.EMAIL_ADMIN, subject, emailModel, "emailReviewCompleted.ftl");
    			
                return "true";
            } catch (Exception e) {
            	// TODO: handle exception
                return "false";
            }
        }
    }

    @RequestMapping("/invitetechnicalreviewer/{id}")
    public String inviteTechnicalReviewer(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            model.put("ilcd", id);
            return "admin/invitetechnicalreviewer";
        }
    }

    @PostMapping("/invitetechnicalreviewer/{id}")
    @ResponseBody
    public String inviteTechnicalReviewerAction(@RequestParam("user") Long userID, @PathVariable("id") String id) {
        try {
            User user = userDao.findOne(userID);
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();
            homologacao.setStatus(5);
            homologacao.setUser(user);
            homologacao.setLastModifier(new Date());
            ilcd.setHomologacao(homologacao);
            ilcdDao.save(ilcd);

            Notification notification = new Notification(1L, "<a href=\"" + Strings.BASE + "/admin/technicalreviewer/" + id + "\">Convite para revisão tecnica</a>", false, userID);
            notificationDao.save(notification);

        	User ilcdUser = ilcd.getUser();
            Map<String, Object> model = new HashMap<String, Object>();
            model.put("ilcdName", ilcd.getName());
            //TODO create field date in ilcd table to retrieve date that ilcd was sent.
            model.put("date", RegisterController.getDateString());
            model.put("ilcdUser", ilcdUser);
            model.put("urlTrack", Strings.BASE+"/admin/notifications");
            model.put("url", Strings.BASE);
            String subject = "Revisão Técnica de Inventário";
            //model.put("goal",);
            Mail mail = RegisterController.getMailUtil();
            
        	mail.sendEmail(user.getEmail(), RegisterController.EMAIL_ADMIN, subject, model, "emailSubmissionToTechnicalReviewer.ftl");
			
            
            return "true";
        } catch (Exception e) {
        	// TODO: handle exception
            System.out.println(e.getMessage());
            return "false";
        }
    }

    @RequestMapping(value = "/technical-reviewer.json", method = RequestMethod.GET)
    @ResponseBody
    String getTechnicalReviewer() {
        Iterable<User> users;
        try {
            users = userDao.findByPerfil(EnumProfile.USER.name());
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(users);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }

    @RequestMapping("/technicalreviewer/{id}/parecer")
    public String technicalReviewerParecer(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("ilcd", ilcd);
//            return "admin/invitetechnicalreviewer";

            return "admin/technicalreviewerparecer";
        }
    }

    @RequestMapping("/technicalreviewer/{id}/parecer/aprovar")
    public String technicalReviewerParecerAprovar(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));

            try {
                Ilcd ilcd = ilcdDao.findById(id);
                ilcd.getHomologacao().setStatus(8);
                return "redirect:/admin/";
            } catch (Exception e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
                return "error";
            }
        }
    }

    @RequestMapping("/technicalreviewer/{id}/parecer/reprovar")
    public String technicalReviewerParecerReprovar(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("ilcd", ilcd);
//            return "admin/invitetechnicalreviewer";

            return "admin/technicalreviewerparecer";
        }
    }

    @RequestMapping("/notification.json")
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
    }

    @RequestMapping("/teste2")
    @ResponseBody
    public String teste() {
        List<User> user = userDao.findAll();
        return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(user);
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

    @Autowired
    private UserDao userDao;

    @Autowired
    private IlcdDao ilcdDao;

    @Autowired
    private HomologacaoDao homologacaoDao;

    @Autowired
    private NotificationDao notificationDao;

    @Autowired
    private TechnicalReviewerDao technicalReviewerDao;
}
