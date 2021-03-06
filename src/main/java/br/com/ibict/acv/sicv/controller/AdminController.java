package br.com.ibict.acv.sicv.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import resources.Strings;
import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.exception.ProfileException;
import br.com.ibict.acv.sicv.exception.RegisterException;
import br.com.ibict.acv.sicv.model.ProfileImage;
import br.com.ibict.acv.sicv.model.Role;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.ProfileImageDao;
import br.com.ibict.acv.sicv.repositories.RoleDao;
import br.com.ibict.acv.sicv.repositories.TechnicalReviewerDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.Password;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private ProfileImageDao profileImageDao;

    @Autowired
    private IlcdDao ilcdDao;
    
    @Autowired
    private RoleDao roleDao;

    @Autowired
    private HomologacaoDao homologacaoDao;

    @Autowired
    private NotificationDao notificationDao;

    @Autowired
    private TechnicalReviewerDao technicalReviewerDao;
    
    private List<User> users;
	
    @RequestMapping("")
    public String root(Map<String, Object> model, Principal principal) {
        if (principal == null) {
            return "/login";
        } else {
        	User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
        	users = userDao.findAll();
            model.put("users", users);
            model.put("name", name);
            model.put("local", "Administrador");
            model.put("localN", 4);

            return "admin/home";
        }
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(Map<String, Object> model) {
        return "home/login";
    }
    
    @RequestMapping(value = "/viewProfile/{index}", method = RequestMethod.GET)
    public String getviewProfile(Map<String, Object> model, @PathVariable("index") Integer index) {
    	User user = users.get(index);
        ProfileImage profImgDB = profileImageDao.findByUser(user);
        model.put("user", user);
        //get data image profile and parse to string wich html recognizes
        if(profImgDB != null){
        	StringBuilder imageString = new StringBuilder();
        	imageString.append("data:image/png;base64,");
        	imageString.append(Base64.getEncoder().encodeToString(profImgDB.getData()));
        	String image = imageString.toString();
        	model.put("imgStr", image);
        }else
        	model.put("imgStr", "");
        
        return "admin/viewProfile";
    }

    @RequestMapping(value = "/deleteProfile/{index}", method = RequestMethod.GET)
    public String deleteUserProfile(RedirectAttributes redirectAttributes, @PathVariable("index") Integer index) {
    	User user = users.get(index);
    	userDao.delete(user.getId());
    	users.remove(index);
    	redirectAttributes.addFlashAttribute("msg", "Usuário, " + user.getFullName() + ", foi deletado com sucesso!");
    	return "redirect:/admin";
    }
    
    @RequestMapping(value = "/enableProfile/{index}", method = RequestMethod.GET)
    public String enableUserProfile(RedirectAttributes redirectAttributes, @PathVariable("index") Integer index) {
    	User user = users.get(index);
    	user.setActive(Boolean.TRUE);
    	userDao.save(user);
    	redirectAttributes.addFlashAttribute("msg", "Usuário, " + user.getFullName() + ", ativado com sucesso!");
    	return "redirect:/admin";
    }
    
    @RequestMapping(value = "/disableProfile/{index}", method = RequestMethod.GET)
    public String disableUserProfile(RedirectAttributes redirectAttributes, @PathVariable("index") Integer index) {
    	User user = users.get(index);
    	user.setActive(Boolean.FALSE);
    	userDao.save(user);
    	redirectAttributes.addFlashAttribute("msg", "Usuário, " + user.getFullName() + ", desativado com sucesso!");
    	return "redirect:/admin";
    }
    
    @RequestMapping(value = "/profile/{index}", method = RequestMethod.GET)
    public String getProfileHandler(Map<String, Object> model, @PathVariable("index") Integer index) {
    	User user = users.get(index);
    	ProfileImage profImgDB = profileImageDao.findByUser(user);
    	model.put("isAdmin", true);
    	model.put("user", user);
    	//get data image profile and parse to string wich html recognizes 
    	if(profImgDB != null){
        	StringBuilder imageString = new StringBuilder();
        	imageString.append("data:image/png;base64,");
        	if(profImgDB.getData() != null){
	        	imageString.append(Base64.getEncoder().encodeToString(profImgDB.getData()));
	        	String image = imageString.toString();
	        	model.put("imgStr", image);
        	}else
        		model.put("imgStr", "");
        	
        }else
        	model.put("imgStr", "");
    	
        return "/profile";
    }
    
    @RequestMapping(value = "/insertProfile", method = RequestMethod.GET)
    public String insertProfileHandler(Map<String, Object> model) {
    	model.put("isAdmin", true);
    	
        return "/admin/newProfile";
    }
    
    @PostMapping("/insertProfile") // //new annotation since 4.3
    public String register(
    		@RequestParam("firstName") String firstName,
    		@RequestParam("lastName") String lastName,
            @RequestParam("email") String email) throws Exception {
        
        User user = new User();
        Role role = new Role( 1, "USER" );
        String senha = Password.generateSalt( 8 );
        user.setPasswordHashSalt( Password.generateSalt( 20 ) );
        user.setPasswordHash( Password.getEncryptedPassword( senha, user.getPasswordHashSalt() ) );
        //Activation Code
        user.setRegistrationKey(Password.generateSalt( 8 ) );
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.addRole(role);
        user.setQntdNotificacoes(0L);
        user.setActiveCode(user.getNewActiveCode());
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        model.put("senha", senha);
        model.put("urlLogin", Strings.BASE+"/login");
        model.put("url", Strings.BASE);
        model.put("link", Strings.BASE + "/register/accountConfirmation?token=" + user.getActiveCode());
        
        try {
        	userDao.save(user);
			RegisterController.mailUtil.sendEmail(email, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegister.ftl");
			
			model.put("urlTrack", Strings.BASE +"/admin/users/");
			model.put("date", RegisterController.getDateString());
			RegisterController.mailUtil.sendEmail(RegisterController.EMAIL_ADMIN, "acv@ibict.br", "Cadastro de Usuário", model, "emailRegisterToAdmin.ftl");
			// TODO criar paginas ou mensagens para popular a view em caso de erro
        } catch (IOException | SQLException e){
        	throw new Exception("Erro no processo de registro de usuario.", e);
		} catch (RegisterException e) {
			throw new RegisterException("Erro no processo de envio de email.", e);
		}

        return "redirect:/admin/";

    }
    
    @PostMapping("/profile")
    public String loginHandle(@RequestParam("profile") String profile, @RequestParam("profileImage") MultipartFile profileImage) {
        
    	//profile = profile.replaceAll("\\[", "").replaceAll("\\]","");
    	Gson gson = new Gson();
    	User user = gson.fromJson(profile, User.class);
    	User userDB = (User) userDao.findOne(user.getId()); 
        //if user password is not empty
        if (user.getPlainPassword().length() > 0) {
        	//if password match and new password is not empty
            if (user.getPlainPassword().equals(userDB.getPlainPassword()) && !user.getNewPassword().trim().equals("")) {
                user.setPasswordHashSalt(Password.generateSalt(20));
                user.setPasswordHash(Password.getEncryptedPassword(user.getNewPassword(), user.getPasswordHashSalt()));
                user.setPlainPassword(user.getNewPassword());
                user.setNewPassword(null);
            } else {
                user.setPasswordHash(userDB.getPasswordHash());
                user.setPasswordHashSalt(userDB.getPasswordHashSalt());
                user.setPlainPassword(userDB.getPlainPassword());
	        }
        }else{
	            user.setPasswordHash(userDB.getPasswordHash());
	            user.setPasswordHashSalt(userDB.getPasswordHashSalt());
	            user.setPlainPassword(userDB.getPlainPassword());
    	}
    	
    	user.setHomologacoes(userDB.getHomologacoes());
    	user.setStatus(userDB.getStatus());  
    	user.setRoles(userDB.getRoles());
    	user.setActive(userDB.getActive());
    	user.setActiveCode(userDB.getActiveCode());
    	ProfileImage profImgDB = profileImageDao.findByUser(userDB);

        if( profileImage != null ) {
        	if(profileImage.getName() != "" && !profileImage.isEmpty()){
	            ProfileImage uploadFile = new ProfileImage();
	            uploadFile.setImageName(profileImage.getOriginalFilename());
	            
	            if(profImgDB != null )
	            	uploadFile.setId(profImgDB.getId());
	            
	            uploadFile.setUser(user);
	            try {
	            	uploadFile.setData(profileImage.getBytes());
	            	user.setProfile_image(uploadFile);
	            	
				} catch (Exception e) {
					// TODO: handle exception
				}
        	}else
        		user.setProfile_image(profImgDB);
        }
        
        userDao.save(user);
        Map<String, Object> model = new HashMap<String, Object>();

        User userSession = (User) session().getAttribute("user");
        if(userSession.getId().equals(user.getId()) )
        	model.put("user", user);

        model.put("msg", "success");

        return "admin/home";
        
    }
    
    @RequestMapping(value = "/saveProfiles", method = RequestMethod.POST)
    public String profiles(ModelMap model, @RequestParam("perfis") String jsonPerfis) throws Exception {
    	User userSession = (User) session().getAttribute("user");
        if (userSession == null) {
            return "login/login";
        } else {
        	Set<Role> profileList = new HashSet<Role>();
        	profileList.addAll(roleDao.findAll());
        	Set<Role> roles = new HashSet<Role>();
        	
        	JSONArray perfis = new JSONArray(jsonPerfis);
        	Integer position = 0;
        	for (int i = 0; i < perfis.length(); i++) {
        		JSONObject jsonObjPerfis = perfis.getJSONObject(i);
        		String perfil = jsonObjPerfis.getString("perfil");
        		//add each string role to list 
            	for (Role role : profileList) {
            		if( role.getRole().equals("USER") )
            			roles.add(role);
    				if( role.getRole().equals(perfil) )
    					roles.add(role);
    			}
            	position = jsonObjPerfis.getInt("position");
        	}
        	
        	try {
        		User user = users.get(position);
        		user.setRoles(roles);
        		userDao.saveAndFlush(user);				
			} catch (ProfileException e) {
				throw new ProfileException("Erro ao atualizar o usuário", e);
				//TODO: Return some page 
			}
        	model.put("users", users);
            model.put("name", userSession.getFullName());
            model.put("local", "Administrador");
            model.put("localN", 4);
        	model.put("msg", "success");
            return "admin/home";
        }
    }

    @PostMapping("/login")
    //@ResponseBody
    public String loginHandle(@RequestParam("email") String email, @RequestParam("password") String senha) {
        User user = userDao.findByEmail(email);
        if (user == null) {
            //return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(false);
            return "redirect:/admin/login";
        } else {
            session().setAttribute("user", user);
            //return new Gson().toJson(true);
            return "redirect:/admin/";
        }
    }

    @RequestMapping("/teste2")
    @ResponseBody
    public String teste() {
        List<User> user = userDao.findAll();
        return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(user);
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }
    
}
