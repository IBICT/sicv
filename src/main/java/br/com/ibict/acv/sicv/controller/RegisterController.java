package br.com.ibict.acv.sicv.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

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
import br.com.ibict.sicv.enums.EnumProfile;
import resources.Strings;

@Controller
public class RegisterController {

	//TODO make file.properties to get admin email and other informations
	public static String EMAIL_ADMIN = "wellingtonsousa@ibict.br";
	
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private Mail mail;
    
    private static Mail mailUtil;
    
    @PostConstruct
    public void buildStatics(){
    	RegisterController.mailUtil = mail;
    }
    
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
        user.setPerfil( EnumProfile.USER.name() );
        user.setQntdNotificacoes(0L);
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        model.put("senha", senha);
        model.put("urlLogin", Strings.BASE+"/login");
        model.put("url", Strings.BASE);
        
        try {
        	userDao.save(user);
			mail.sendEmail(email, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegister.ftl");
			
			model.put("urlTrack", Strings.BASE +"/admin/users/");
			model.put("date", getDateString());
			mail.sendEmail(EMAIL_ADMIN, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegisterToAdmin.ftl");
			// TODO criar paginas ou mensagens para popular a view em caso de erro
        } catch (IOException | SQLException e){
        	throw new Exception("Erro no processo de registro de usuario.", e);
		} catch (RegisterException e) {
			throw new RegisterException("Erro no processo de envio de email.", e);
		}
        
        return "register/sendEmail";

    }
    
    public static String getDateString(){
    	Calendar date = Calendar.getInstance();
    	SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    	String strDate = fmt.format(date.getTime());
    	 
    	return strDate;
    }
    
    public static Mail getMailUtil(){
    	return mailUtil;
    }
}
