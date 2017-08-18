package br.com.ibict.acv.sicv.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ibict.acv.sicv.exception.RegisterException;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.acv.sicv.util.Password;
import resources.Strings;

@Controller
public class RegisterController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private Mail mail;
    
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
            @RequestParam("dsPurpose") String dsPurpose) throws Exception {
        
        User user = new User();
        user.setEmail(email);
        
        user.setPasswordHashSalt( Password.generateSalt( 20 ) );
        user.setPasswordHash( Password.getEncryptedPassword( senha, user.getPasswordHashSalt() ) );
        //Activation Code
        user.setRegistrationKey(Password.generateSalt( 8 ) );
        
        user.setTitle(title);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setGender(gender);
        user.setJobPositon(jobPositon);
        user.setTelefone(telefone);
        user.setInstituicao(instituicao);
        user.setDsPurpose(dsPurpose);
        user.setPerfil("USUARIO");
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("usuario", user);
        model.put("senha", senha);
        model.put("urlLogin", Strings.BASE+"/login");
        model.put("url", Strings.BASE);
        
        try {
        	userDao.save(user);
			mail.sendEmail(email, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegister.ftl");
			// TODO criar paginas ou mensagens para popular a view em caso de erro
        } catch (IOException | SQLException e){
        	throw new Exception("Erro no processo de registro de usuario.", e);
		} catch (RegisterException e) {
			throw new RegisterException("Erro no processo de envio de email.", e);
		}
        
        return "register/sendEmail";

    }

}
