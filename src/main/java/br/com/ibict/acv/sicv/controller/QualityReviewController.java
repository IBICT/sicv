package br.com.ibict.acv.sicv.controller;

import br.com.ibict.acv.sicv.CustomAuthProvider;
import static br.com.ibict.acv.sicv.controller.AdminController.session;
import static br.com.ibict.acv.sicv.controller.HomeController.session;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    @RequestMapping(value={"", "/"})
    public String index(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getUserName();
        model.put("username", name);
        
        
        List<Homologacao> lista = homologacaoDao.findByUserAndStatus(user, 2);
        Homologacao homo = lista.get(0);
        model.put("ilcd", homo.getIlcd());
        
        System.out.println(lista.isEmpty());
        
        return "qualityreview/index";
    }
    
    @RequestMapping(value={"accept/{id}/", "/accept/{id}/", "accept/{id}", "/accept/{id}"})
    public String accept(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            Homologacao homo = homologacaoDao.findOne(id);
            homo.setStatus(3);
            homologacaoDao.save(homo);
            return "redirect:/qualityreview/";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value={"/{id}/", "{id}/", "{id}", "/{id}"})
    public String itemDeteil(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getUserName();
            System.out.println(id);
            
            //lcd ilcd = ilcdDao.findByUuid(id);
            //List<Ilcd> ilcds = ilcdDao.findByUuid(id);
            //System.out.println(ilcds.size());
            //if (!ilcds.isEmpty()) {
                //Ilcd ilcd = ilcds.get(0);
                Ilcd ilcd = ilcdDao.findOne(id);
                System.out.println(ilcd.getName());
                System.out.println(ilcd.getUuid());
            //} else {
            //    System.out.println("Esta vazio");
            //}
            //model.put("user", user);
            //model.put("ilcd", ilcd);
            return "qualityreview/item";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value={"/{id}/review", "/{id}/review/"})
    public String itemReview(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getUserName();
            Ilcd ilcd = ilcdDao.findById(id);
            model.put("username", name);
            model.put("ilcd", ilcd);
            return "qualityreview/review";
        } catch (Exception e) {
            return "error";
        }
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

}