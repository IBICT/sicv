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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ibict.acv.sicv.exception.RegisterException;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.PasswordReset;
import br.com.ibict.acv.sicv.model.Role;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.PasswordResetDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.acv.sicv.util.Password;
import java.util.Date;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import resources.Strings;

@Controller
public class RegisterController {

    //TODO make file.properties to get admin email and other informations
    public static String EMAIL_ADMIN = "acv@ibict.br";

    @Autowired
    private UserDao userDao;

    @Autowired
    private Mail mail;

    @Autowired
    private PasswordResetDao passwordResetDao;

    public static Mail mailUtil;

    @PostConstruct
    public void buildStatics() {
        RegisterController.mailUtil = mail;
    }

    @RequestMapping("/register")
    public String register(Map<String, Object> model) {
        return "register/register";
    }

    @PostMapping("/register") // //new annotation since 4.3
    public String register(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("organization") String organization,
            @RequestParam("country") String country,
            @RequestParam("language") String language,
            @RequestParam("otherLanguage") String otherLanguage,
            @RequestParam("title") String title,
            @RequestParam("jobPosition") String jobPosition,
            @RequestParam("orcid") String orcid,
            @RequestParam("curriculum") String curriculum,
            @RequestParam("dsPurpose") String dsPurpose,
            @RequestParam("senha") String senha) throws Exception {

        User user = new User();
        Role role = new Role(1, "USER");

        user.setPasswordHashSalt(Password.generateSalt(20));
        user.setPasswordHash(Password.getEncryptedPassword(senha, user.getPasswordHashSalt()));
        //Activation Code
        user.setRegistrationKey(Password.generateSalt(8));

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setEmail(email);
        user.setOrganization(organization);
        user.setCountry(country);
        user.setLanguage(language);
        user.setOtherLanguage(otherLanguage);
        user.setTitle(title);
        user.setJobPosition(jobPosition);
        user.setOrcid(orcid);
        user.setCurriculum(curriculum);
        user.setDsPurpose(dsPurpose);
        user.addRole(role);
        user.setQntdNotificacoes(0L);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        model.put("senha", senha);
        model.put("urlLogin", Strings.BASE + "/login");
        model.put("url", Strings.BASE);

        try {
            userDao.save(user);
            Notification notify = new Notification();
            notify.fillMsgADMIN_NEW_REG(user.getId(), user.getFirstName() + " " + user.getLastName());
            mail.sendEmail(email, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegister.ftl");

            model.put("urlTrack", Strings.BASE + "/admin/users/");
            model.put("date", getDateString());
            mail.sendEmail(EMAIL_ADMIN, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegisterToAdmin.ftl");
            // TODO criar paginas ou mensagens para popular a view em caso de erro
        } catch (IOException | SQLException e) {
            throw new Exception("Erro no processo de registro de usuario.", e);
        } catch (RegisterException e) {
            throw new RegisterException("Erro no processo de envio de email.", e);
        }

        return "register/sendEmail";

    }

    @RequestMapping("/register/forgotPassword")
    public String getForgotPassword(Map<String, Object> model) {
        return "register/forgotPassword";
    }

    @PostMapping("/register/forgotPassword")
    public String register(@RequestParam("email") String email, ModelMap modelMap) throws Exception {

        Map<String, Object> model = new HashMap<String, Object>();
        User user = userDao.findByEmail(email);
        if (user != null) {
            try {
                Date date = new Date();
                PasswordReset passwordReset = new PasswordReset();
                passwordReset.setExpires(date);
                passwordReset.setUser(user);
                passwordReset.setHash("u"+user.getId()+"h"+date.getTime());
                passwordResetDao.save(passwordReset);

                model.put("user", user);
                modelMap.put("recoveryMsg", "O e-mail com link para redefinir a senha foi enviado!");
                model.put("urlReset", Strings.BASE + "/register/resetPassword?a=" + passwordReset.getHash());
                model.put("url", Strings.BASE);

                model.put("date", getDateString());
                mail.sendEmail(email, EMAIL_ADMIN, "Redefinição de senha", model, "emailResetPassword.ftl");

            } catch (IOException | SQLException e) {
                throw new Exception("Erro no processo de solicitação de redefinição de senha de usuario.", e);
            } catch (RegisterException e) {
                throw new RegisterException("Erro no processo de envio de email.", e);
            }
        } else {
            modelMap.put("recoveryMsg", "O e-mail com link para redefinir a senha foi enviado!");
        }
        return "register/forgotPassword";
    }

    @RequestMapping("/register/resetPassword")
    public String getResetPassword(Map<String, Object> model, @RequestParam("a") String hash) {

        PasswordReset passwordReset = passwordResetDao.findByHash(hash);
        if (passwordReset != null) {
            if (passwordReset.getExpires().after(new Date())) {
                model.put("resetSuccess", false);
                return "register/resetPassword";
            } else {
                return "register/expiredReset";
            }
        } else {
            return "/404";
        }
    }

    @PostMapping("/register/resetPassword?a={key}")
    public String resetPassword(@RequestParam("plainPassword") String plainPassword, Map<String, Object> model) {
        //TODO data of user to set new password... how to retrieve?
        model.put("resetSuccess", true);
        return "register/resetPassword";
    }

    public static String getDateString() {
        Calendar date = Calendar.getInstance();
        SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String strDate = fmt.format(date.getTime());

        return strDate;
    }

    public static Mail getMailUtil() {
        return mailUtil;
    }
}
