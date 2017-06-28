package br.com.ibict.acv.sicv;

import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/")
    public String root(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "admin/home";
        }
    }

    @PostMapping("/login")
    @ResponseBody
    public String loginHandle(@RequestParam("email") String email, @RequestParam("password") String senha) {
        User user = userDao.findByEmail(email);
        if (user == null) {
            return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(false);
        } else {
            session().setAttribute("user", user);
            return new Gson().toJson(true);
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

    @RequestMapping("/homologacao/accept")
    @ResponseBody
    public String homologacaoAccept(@RequestParam("id") String id) {
        try {
            User user = (User) session().getAttribute("user");
            Ilcd ilcd = ilcdDao.findById(id);
            Homologacao homologacao = ilcd.getHomologacao();
            homologacao.setStatus(2);
            homologacaoDao.save(homologacao);
            return "true";
        } catch (Exception e) {
            return "false";
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
            ilcdDao.save(ilcd);

            model.put("user", session().getAttribute("user"));
            return "admin/qualidata";
        }
    }
    
    @RequestMapping(value = "/homologacao/{id}/parecer", method = RequestMethod.GET)
    @ResponseBody
    public String parecerQualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            
            Ilcd ilcd = ilcdDao.findById(id);
            
            return (new Gson().toJson(ilcd));
        }
    }
    
    @RequestMapping(value = "/homologacao/{id}/aprovarqualidata", method = RequestMethod.GET)
    @ResponseBody
    public String AprovarQualidata(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            
            Ilcd ilcd = ilcdDao.findById(id);
            ilcd.getHomologacao().setStatus(4);
            ilcdDao.save(ilcd);
            return "aprovarqualidata";
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
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }

    @Autowired
    private UserDao userDao;

    @Autowired
    private IlcdDao ilcdDao;

    @Autowired
    private HomologacaoDao homologacaoDao;
}
