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
@RequestMapping("/tecnicalreview")
public class TecnicalReviewController {

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

        List<Homologacao> invites = homologacaoDao.findByUserAndStatus(user, 2);
        model.put("invite", invites);

        List<Homologacao> works = homologacaoDao.findByUserAndStatus(user, 3);
        model.put("work", works);

        List<String> teste = new ArrayList<>();
        teste.add("A");
        teste.add("B");
        teste.add("C");
        teste.add("D");
        model.put("teste", null);

        //System.out.println(lista.isEmpty());
        return "tecnicalreview/index";
    }

    @RequestMapping(value = {"accept/{id}/", "/accept/{id}/", "accept/{id}", "/accept/{id}"})
    public String accept(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            Homologacao homo = homologacaoDao.findOne(id);
            homo.setStatus(3);
            homologacaoDao.save(homo);
            Status status = homo.getLastArchive().getStatus();
            status.setExpectedDate(new Date());
            statusDao.save(status);
            return "redirect:/tecnicalreview/";
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

            //lcd ilcd = ilcdDao.findByUuid(id);
            //List<Ilcd> ilcds = ilcdDao.findByUuid(id);
            //System.out.println(ilcds.size());
            //if (!ilcds.isEmpty()) {
            //Ilcd ilcd = ilcds.get(0);
            Ilcd ilcd = ilcdDao.findOne(id);
            //} else {
            //    System.out.println("Esta vazio");
            //}
            //model.put("user", user);
            model.put("ilcd", ilcd);
            model.put("archive", ilcd.getHomologation().getLastArchive());
            return "tecnicalreview/item";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{id}/review", "/{id}/review/"})
    public String itemReview(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("username", name);
            model.put("ilcd", ilcd);
            return "tecnicalreview/review";
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
            statusDao.save(status);
            return "redirect:/tecnicalreview/";
        } catch (Exception e) {
            return "ERRO 500";
        }
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

}
