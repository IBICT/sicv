package br.com.ibict.acv.sicv.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import resources.Strings;
import br.com.ibict.acv.sicv.exception.RegisterException;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.PasswordReset;
import br.com.ibict.acv.sicv.model.Role;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.PasswordResetDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.acv.sicv.util.Password;

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
        model.put("url", Strings.BASE);
        user.setActiveCode(user.getNewActiveCode());
        model.put("link", Strings.BASE + "/register/accountConfirmation?token=" + user.getActiveCode());

        try {
            userDao.save(user);
            mail.sendEmail(email, "acv@ibict.br", "Registro de Conta no SICV", model, "emailRegister.ftl");
            Notification notify = new Notification();
            notify.fillMsgADMIN_NEW_REG(user.getId(), user.getFirstName() + " " + user.getLastName());

            model.put("urlTrack", Strings.BASE + "/admin/users/");
            model.put("date", getDateString());
            mail.sendEmail("acv@ibict.br", "acv@ibict.br", "Registro de Conta no SICV", model, "emailRegisterToAdmin.ftl");
            // TODO criar paginas ou mensagens para popular a view em caso de erro
        } catch (IOException | SQLException e) {
            throw new Exception("Erro no processo de registro de usuario.", e);
        } catch (RegisterException e) {
            throw new RegisterException("Erro no processo de envio de email.", e);
        }

        return "register/successRegister";

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
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                c.add(Calendar.HOUR, 1);
                date = c.getTime();

                PasswordReset passwordReset = new PasswordReset();
                passwordReset.setExpires(date);
                passwordReset.setUser(user);
                passwordReset.setHash("u" + user.getId() + "h" + date.getTime());
                passwordResetDao.save(passwordReset);

                model.put("user", user);
                modelMap.put("recoveryMsg", "O e-mail com link para redefinir a senha foi enviado!");
                modelMap.put("emailSend", email);
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
            //modelMap.put("recoveryMsg", "O e-mail com link para redefinir a senha foi enviado!");
        }
        return "register/forgotPassword";
    }

    @RequestMapping("/register/accountConfirmation")
    public String accountConfirmation(Map<String, Object> model, @RequestParam("token") String token) {

        User user = userDao.findByActiveCode(token);

        if (user != null) {
            if (user.getActive() == null || !user.getActive()) {
                user.setActive(Boolean.TRUE);
                try {
                    userDao.save(user);
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                    e.printStackTrace();
                    return "redirect:" + Strings.BASE + "/error?code=500";
                }
                try {
                    model.put("user", user);
                    model.put("url", Strings.BASE);
                    mail.sendEmail(user.getEmail(), "acv@ibict.br", "Cadastro de Usuário", model, "accountConfirmation.ftl");
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                    e.printStackTrace();
                }
                return "redirect:" + Strings.BASE;
            } else {
                return "redirect:/login";
            }
        } else {
            return "/404";
        }

    }

    @RequestMapping("/register/resetPassword")
    public String getResetPassword(Map<String, Object> model, @RequestParam("a") String hash) {

        PasswordReset passwordReset = passwordResetDao.findByHash(hash);
        if (passwordReset != null) {
            if (passwordReset.getExpires().after(new Date())) {
                model.put("resetSuccess", false);
                model.put("passwordReset", passwordReset);
                return "register/resetPassword";
            } else {
                return "register/expiredReset";
            }
        } else {
            return "/404";
        }
    }

    @PostMapping("/register/resetPassword")
    public String resetPassword(@RequestParam("password") String plainPassword, Map<String, Object> model, @RequestParam("a") String hash) {
        User user = passwordResetDao.findByHash(hash).getUser();
        user.setPasswordHashSalt(Password.generateSalt(20));
        user.setPasswordHash(Password.getEncryptedPassword(plainPassword, user.getPasswordHashSalt()));
        userDao.save(user);
        model.put("resetSuccess", true);
        model.put("plainPassword", plainPassword);
        model.put("resetedMsg", "Sua senha foi redefinida com sucesso!");
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

    @RequestMapping(value = "/register/getUser", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody
    String getUser(@RequestParam("email") String mail) {
        User user = userDao.findByEmail(mail);
        if (user != null) {
            return "true";
        } else {
            return "false";
        }
    }
    
}
