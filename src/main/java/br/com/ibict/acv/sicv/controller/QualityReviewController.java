package br.com.ibict.acv.sicv.controller;

import br.com.ibict.acv.sicv.CustomAuthProvider;
import static br.com.ibict.acv.sicv.controller.AdminController.session;
import static br.com.ibict.acv.sicv.controller.HomeController.session;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.QualiData;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.QualiDataDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import com.google.gson.Gson;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author deivdywilliamsilva
 */
@Controller
@RequestMapping("/qualityreview")
public class QualityReviewController {

    @Autowired
    private IlcdDao ilcdDao;

    @Autowired
    private StatusDao statusDao;

    @Autowired
    private HomologacaoDao homologacaoDao;
    
    @Autowired
    private QualiDataDao qualiDataDao;

    @RequestMapping(value = {"", "/"})
    public String index(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("username", name);

        List<Status> invites = statusDao.findByRevisorAndAcceptAndType(user, null, 1);
        model.put("invite", invites);

        List<Status> works = statusDao.findByRevisorAndAcceptAndType(user, true, 1);
        model.put("work", works);

        return "qualityreview/index";
    }

    @RequestMapping(value = {"accept/{id}/", "/accept/{id}/", "accept/{id}", "/accept/{id}"})
    public String accept(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            
            Status status = statusDao.findOne(id);
            status.setAccept(true);
            status.setRequestDate(new Date());
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 5);
            status.setExpectedDate(calendar.getTime());
            statusDao.save(status);
            
            Homologacao homo = status.getIlcd().getHomologation();
            homo.setStatus(2);
            homologacaoDao.save(homo);
            return "redirect:/qualityreview/"+status.getId();
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value = {"refuse/{id}/", "/refuse/{id}/", "refuse/{id}", "/refuse/{id}"})
    public String refuse(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            Status status = statusDao.findOne(id);
            status.setAccept(false);
            statusDao.save(status);
            return "redirect:/qualityreview/"+status.getId();
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{id}/", "{id}/", "{id}", "/{id}"})
    public String itemDeteil(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            model.put("username", name);
            Status status1 = statusDao.findOne(id);
            model.put("status1", status1);
            Ilcd ilcd = status1.getIlcd();
            model.put("ilcd", ilcd);
            List<Status> status2 = statusDao.findByIlcdAndType(ilcd, 1);
            model.put("status2", status2);
            return "qualityreview/item";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{id}/review", "/{id}/review/"})
    public String itemReview(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            Status status = statusDao.findOne(id);
            Ilcd ilcd = status.getIlcd();
            model.put("username", name);
            model.put("ilcd", ilcd);
            return "qualityreview/review";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value = {"/{id}/review", "/{id}/review/"}, method = RequestMethod.POST)
    public String reviewAction(Map<String, Object> model, @PathVariable("id") Long id, @RequestParam Map<String,String> allRequestParams) {
        try {
//            for (Map.Entry<String, String> param : allRequestParams.entrySet()) {
//                String key = param.getKey();
//                String value = param.getValue();
//                System.out.println(key+" = "+value);
//            }
            
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologation();
            homologacao.setStatus(4);
            Status status = homologacao.getLastArchive().getStatus();
            homologacaoDao.save(homologacao);
            Gson gson = new Gson();
            QualiData qualiData = gson.fromJson(allRequestParams.get("json"), QualiData.class);
            Integer resultado = gson.fromJson(allRequestParams.get("resultado"), Integer.class);
            qualiDataDao.save(qualiData);
            //status.setReviewer(qualiData);
            status.setQualiData(qualiData);
            status.setStatus(resultado);
            statusDao.save(status);
            return "redirect:/qualityreview/";
        } catch (Exception e) {
            return "ERRO 500";
        }
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

}
