package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.tomcat.util.http.fileupload.IOUtils;
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
import org.springframework.web.multipart.MultipartFile;
import resources.Strings;

@Controller
public class HomeController {
    
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private IlcdDao ilcdDao;
    
    @RequestMapping("/")
    public String root(Map<String, Object> model) {
        return "home/home";
    }
    
    @RequestMapping("/ilcd")
    public String listILCDs(Map<String, Object> model) {
        return "home/list";
    }
    
    @RequestMapping(value = "/ilcds.json", method = RequestMethod.GET)
    @ResponseBody
    String getJSON() {
        Iterable<Ilcd> ilcds;
        try {
            ilcds = ilcdDao.findByBase(1L);
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new Gson().toJson(ilcds);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }
    
    @RequestMapping("/ilcd/new")
    public String newILCD(Map<String, Object> model) {
        return "home/form";
    }
    
    @RequestMapping(value = "/ilcd/{file_name}", method = RequestMethod.GET)
    public void getFile(
            @PathVariable("file_name") String fileName,
            HttpServletResponse response) {
        try {
            File fileToDownload = new File(Strings.UPLOADED_FOLDER + fileName);
            if (!fileToDownload.exists()) {
                String errorMessage = "Sorry. The file you are looking for does not exist";
                System.out.println(errorMessage);
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
                outputStream.close();
                return;
            }

            InputStream inputStream = new FileInputStream(fileToDownload);
            response.setContentType("application/force-download");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ".zip");
            IOUtils.copy(inputStream, response.getOutputStream());
            response.flushBuffer();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    @PostMapping("/login")
    @ResponseBody
    public String login(
            @RequestParam("email") String email,
            @RequestParam("senha") String senha) {
        User user = userDao.findByEmail(email);
        if (user.getPasswordHash().equals(new Sha512Hash(senha, user.getPasswordHashSalt(), 5).toHex())) {
            session().setAttribute("user", user);
            return new Gson().toJson(user);
        } else {
            return new Gson().toJson(false);
        }
        
    }
    
    @RequestMapping("/logout")
    @ResponseBody
    public String logout() {
        session().removeAttribute("user");
        return new Gson().toJson(true);
    }
    
    public static HttpSession session() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }
    
}
