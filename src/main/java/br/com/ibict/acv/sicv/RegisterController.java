package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import org.apache.shiro.crypto.hash.Sha512Hash;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {

    @Autowired
    private UserDao userDao;
    
     @RequestMapping("/register")
    public String register(Map<String, Object> model) {
        return "register/register";
    }

    @PostMapping("/register") // //new annotation since 4.3
    public String register(
            @RequestParam("email") String email,
            @RequestParam("senha") String senha,
            @RequestParam("title") String title,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("gender") String gender,
            @RequestParam("jobPositon") String jobPositon,
            @RequestParam("telefone") String telefone,
            @RequestParam("instituicao") String instituicao,
            @RequestParam("dsPurpose") String dsPurpose) {
        
        User user = new User();
        user.setEmail(email);
        
        user.setPasswordHashSalt("f201fe537fea09686fff79463c21a12812c385a0bf66711d17");
        user.setPasswordHash(new Sha512Hash(senha, "f201fe537fea09686fff79463c21a12812c385a0bf66711d17", 5).toHex());
        
        user.setTitle(title);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setGender(gender);
        user.setJobPositon(jobPositon);
        user.setTelefone(telefone);
        user.setInstituicao(instituicao);
        user.setDsPurpose(dsPurpose);
        user.setPerfil("USUARIO");
        
        userDao.save(user);
        
        return "register/sendEmail";

    }

}
