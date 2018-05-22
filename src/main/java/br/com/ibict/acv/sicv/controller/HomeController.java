package br.com.ibict.acv.sicv.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import resources.Strings;
import sun.misc.BASE64Encoder;
import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.model.Archive;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.ProfileImage;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.ExclStrat;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.acv.sicv.util.Password;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class HomeController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private StatusDao statusDao;

    @Autowired
    private HomologacaoDao homologationDao;

    @Autowired
    private NotificationDao notificationDao;

    public static List<Notification> notifications = new ArrayList<Notification>();

    public List<Homologacao> homologations;

    public static List<Ilcd> ilcds;

    @Autowired
    private IlcdDao ilcdDao;

    public static boolean hasSubmitOrStatus = false;

    @RequestMapping("/")
    public String getRoot(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("local", "Meus inventários");
        model.put("localN", 0);
        model.put("isUserLabel", true);
//        if( ilcds == null || hasSubmitOrStatus){
//        	ilcds = ilcdDao.findIlcdsByLikeEmail( user.getEmail() );
//        	hasSubmitOrStatus = true;
//        }
        ilcds = ilcdDao.findByUser(user);
        model.put("ilcds", ilcds);

        return "home/home";
    }

    @RequestMapping("/manager")
    public String getRootManager(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("isUserLabelFalse", true);
        model.put("username", name);
        if (ilcds == null || hasSubmitOrStatus) {
            ilcds = ilcdDao.findAll();
            hasSubmitOrStatus = true;
        }
        model.put("ilcds", ilcds);

        return "home/home";
    }

    @RequestMapping("/403")
    public String getDeniedAccess(Map<String, Object> model) {
        return "/403";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(Map<String, Object> model) {
        return "home/login";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String getProfileHandler(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");

        model.put("user", user);
        if(user.getProfile_image().getImageName() != null){
        	BASE64Encoder base64Encoder = new BASE64Encoder();
        	StringBuilder imageString = new StringBuilder();
        	imageString.append("data:image/png;base64,");
        	imageString.append(base64Encoder.encode(user.getProfile_image().getData()));
        	String image = imageString.toString();
        	model.put("imgStr", image);
        }else
        	model.put("imgStr", "");
        
        return "/profile";
    }

    @PostMapping("/profile")
    public String loginHandle(@RequestParam("profile") String profile, @RequestParam("profileImage") MultipartFile profileImage) {

        User userSession = (User) session().getAttribute("user");
        //profile = profile.replaceAll("\\[", "").replaceAll("\\]","");
        Gson gson = new Gson();
        User user = gson.fromJson(profile, User.class);
        //if user password is not empty
        if (user.getPlainPassword().length() > 0) {
        	//if passaword match and new password is not empty
            if (user.getPlainPassword().equals(userSession.getPlainPassword()) && !user.getNewPassword().trim().equals("")) {
                user.setPasswordHashSalt(Password.generateSalt(20));
                user.setPasswordHash(Password.getEncryptedPassword(user.getNewPassword(), user.getPasswordHashSalt()));
                user.setPlainPassword(user.getNewPassword());
                user.setNewPassword(null);
            } else {
                user.setPasswordHash(userSession.getPasswordHash());
                user.setPasswordHashSalt(userSession.getPasswordHashSalt());
                user.setPlainPassword(userSession.getPlainPassword());
            }
        }else{
            user.setPasswordHash(userSession.getPasswordHash());
            user.setPasswordHashSalt(userSession.getPasswordHashSalt());
            user.setPlainPassword(userSession.getPlainPassword());
        }

        user.setHomologacoes(userSession.getHomologacoes());
        user.setStatus(userSession.getStatus());
        user.setRoles(userSession.getRoles());
        user.setActive(userSession.getActive());
        user.setActiveCode(userSession.getActiveCode());
        
        if( profileImage != null ) {
        	if(profileImage.getName() != "" && !profileImage.isEmpty()){
	            ProfileImage uploadFile = new ProfileImage();
	            uploadFile.setImageName(profileImage.getOriginalFilename());
	            
	            if(userSession.getProfile_image().getId() != null )
	            	uploadFile.setId(userSession.getProfile_image().getId());
	            
	            uploadFile.setUser(user);
	            try {
	            	uploadFile.setData(profileImage.getBytes());
	            	user.setProfile_image(uploadFile);
	            	
				} catch (Exception e) {
					// TODO: handle exception
				}
        	}else
        		user.setProfile_image(userSession.getProfile_image());
        }
        
        userDao.save(user);
        session().setAttribute("user", user);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("successMessage", "Perfil atualizado com sucesso!");

        return "successAlterProfile";
    }

    @RequestMapping("/authorIlcd/{ilcdId}")
    public String getAuthorIlcd(Map<String, Object> model, @PathVariable("ilcdId") Long ilcdId) {
        Ilcd ilcd = ilcdDao.findById(ilcdId);
        Status initialStatus = null, initialStatusT = null, lastStatusUserT = null, lastStatusUser = null, lastStatusQ = null, lastStatusT = null;
        Ilcd currentIlcd = ilcdDao.findById(ilcd.getId());
        List<Status> allStatus = currentIlcd.getStatus();
        User user = (User) session().getAttribute("user");
        List<Status> statusHistory = new ArrayList<Status>();
        List<Status> statusHistoryT = new ArrayList<Status>();
        for (Status status : allStatus) {
            //fill list Q+
            if (status.getType() == 3 && status.getPrevious().getType() == 1) {
                statusHistory.add(status);
                if (lastStatusUser != null) {
                    if (lastStatusUser.getId() < status.getId()) {
                        lastStatusUser = status;
                    }
                } else {
                    lastStatusUser = status;
                }
            }
            //fill list T+
            if (status.getType() == 3 && status.getPrevious().getType() == 2) {
                statusHistoryT.add(status);
                if (lastStatusUserT != null) {
                    //retrieve the last status T+
                    if (lastStatusUser.getId() < status.getId()) {
                        lastStatusUserT = status;
                    }
                } else {
                    lastStatusUserT = status;
                }
            }

            //retrieve the initial status T+
            if (initialStatusT != null && status.getType() == 2) {
                if (initialStatusT.getId() > status.getId()) {
                    initialStatusT = status;
                }
            } else {
                if (status.getType() == 2) {
                    initialStatusT = status;
                }
            }

            //retrieve the initial status
            if (initialStatus != null) {
                if (initialStatus.getId() > status.getId()) {
                    initialStatus = status;
                }
            } else {
                initialStatus = status;
            }

            //retrieve the last status Q+
            if (status.getType() == 1) {
                if (lastStatusQ != null) {
                    if (lastStatusQ.getId() < status.getId() && status.getType() == 1) {
                        lastStatusQ = status;
                    }
                    if (lastStatusQ.getId() < status.getId() && status.getType() == 2) {
                        lastStatusT = status;
                    }
                } else {
                    lastStatusQ = status;
                }
            }
        }

        Collections.reverse(statusHistory);
        Collections.reverse(statusHistoryT);

        model.put("local", "Meus inventários > <u>" + ilcd.getTitle() + "</u>");
        model.put("localN", 0);
        model.put("isUserLabel", true);
        model.put("user", user);
        model.put("ilcd", ilcd);
        
        model.put("lastStatusUser", lastStatusUser);
        model.put("lastStatusUserT", lastStatusUserT);
        model.put("lastStatusQ", lastStatusQ);
        model.put("lastStatusT", lastStatusT);
        model.put("statusHistory", statusHistory);
        model.put("statusHistoryT", statusHistoryT);
        model.put("initialStatus", initialStatus);
        model.put("initialStatusT", initialStatusT);
        return "index";
    }

    @RequestMapping("/ilcd")
    public String listILCDs(Map<String, Object> model) {
        return "home/list";
    }

    @RequestMapping(value = "/ilcds.json", method = RequestMethod.GET)
    @ResponseBody
    String getJSON() throws SecurityException, NoSuchFieldException, ClassNotFoundException {
        Iterable<Ilcd> ilcds;
        try {
            ilcds = ilcdDao.findByBase(1L);
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()
                .setExclusionStrategies(new ExclStrat("br.com.ibict.acv.sicv.model.Ilcd.homologacao"))
                .create()
                .toJson(ilcds);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }

    @RequestMapping("/ilcd/new")
    public String newILCD(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "redirect:/login";
        } else {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            model.put("user", user);
            model.put("local", "Meus inventários > Submissão de Inventário");
            model.put("localN", 0);
            model.put("isUserLabel", true);
            return "home/form";
        }
    }

    @PostMapping("/ilcd/new") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("review") MultipartFile review, @RequestParam("file") MultipartFile file,
            @RequestParam("fileComplement") MultipartFile fileComplement, @RequestParam("json") String json,
            @RequestParam("ilcd") String jsonIlcd, @RequestParam("authors") String jsonAuthors,
            @RequestParam("emails") String jsonEmails, RedirectAttributes redirectAttributes) throws Exception {

        Gson gson = new Gson();
        //JSONObject jsonObj = new JSONObject(jsonAuthors);    	
        Ilcd ilcd = gson.fromJson(jsonIlcd, Ilcd.class);

        JSONArray authors = new JSONArray(jsonAuthors);
        JSONArray emails = new JSONArray(jsonEmails);
        for (int i = 0; i < authors.length(); i++) {
            JSONObject jsonObjAuthors = authors.getJSONObject(i);
            //System.out.println(jsonObjAuthors.getString("value"));
            JSONObject jsonObjEmails = emails.getJSONObject(i);
            //System.out.println(jsonObjEmails.getString("value"));
            ilcd.addAuthor(jsonObjAuthors.getString("value"));
            ilcd.addEmail(jsonObjEmails.getString("value"));
        }

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/admin/ilcd/uploadStatus";
        }

        try {

            // Get the file and save it somewhere. 1 is inicial version
            byte[] bytesfile = file.getBytes();
            Path path = Paths.get(Strings.UPLOADED_FOLDER + MD5(bytesfile));
            String pathResolve = path.resolve("ILCD.zip").toString();

            if (path.toFile().exists()) {
                redirectAttributes.addFlashAttribute("message", "File exist, not replace.");
                return "redirect:/admin/ilcd/uploadStatus";
            }
            Files.createDirectory(path);
            Files.write(path.resolve("./ILCD.zip"), bytesfile);
            User ilcdUser = (User) session().getAttribute("user");
            Status status = new Status();
            status.setType(1);
            status.setIlcd(ilcd);
            ilcd.addStatus(status);
            //move to zipToIlcd method after refactoring;
            ilcd.setName(file.getOriginalFilename());

            zipToIlcd(pathResolve, ilcd);
            status.getArchive().setPathFile(MD5(bytesfile));
            if (!review.isEmpty() && ilcd.getHasReview()) {
                File reviewFile = new File(path.resolve("./" + Archive.REVIEW + ".zip").toString());
                ZipOutputStream out = new ZipOutputStream(new FileOutputStream(reviewFile));
                ZipEntry e = new ZipEntry(review.getOriginalFilename());
                out.putNextEntry(e);

                byte[] data = review.getBytes();
                out.write(data, 0, data.length);
                out.closeEntry();
                out.close();
            }
            if (!fileComplement.isEmpty()) {
                File complementFile = new File(path.resolve("./" + Archive.COMPLEMENT + ".zip").toString());
                ZipOutputStream out = new ZipOutputStream(new FileOutputStream(complementFile));
                ZipEntry e = new ZipEntry(fileComplement.getOriginalFilename());
                out.putNextEntry(e);

                byte[] data = fileComplement.getBytes();
                out.write(data, 0, data.length);
                out.closeEntry();
                out.close();
            }

            Notification notificationManager, notificationUser = new Notification();
            Homologacao homolog = new Homologacao();
            //notificationUser.setUser( ilcd.getUser().getId() );
            notificationUser.setNotifyDate(Calendar.getInstance().getTime());

            notificationManager = SerializationUtils.clone(notificationUser);

            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "' ilcd:" + ilcd.getTitle());
            ilcd.setJson1(json);
            homolog.setStatus(1);

            //Pendecia inicial verdadeira
            homolog.setPending(true);

            // Prazo incial de 5 dias
            Date dt = new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(dt);
            c.add(Calendar.DATE, 5);
            dt = c.getTime();
            homolog.setPrazo(dt);

            //homolog.setUser( manager );
            homolog.setSubmission(Calendar.getInstance().getTime());
            homolog.setIlcd(ilcd);
            //salva o último arquivo para a homologacao
            //homolog.setLastArchive( ilcd.getStatus().get(0).getArchive() );
            ilcd.setHomologation(homolog);
            //salvando homologação outros objetos são salvos e atualizados em cascata
            homologationDao.saveAndFlush(homolog);
            //TODO: IMPORTANT: verify if has only one notification by user and for all manager
            notificationUser.fillMsgUSER_SUBMISSION(ilcd.getId(), ilcd.getTitle());
            notificationUser.setUser(ilcdUser);
            ilcdUser.addNotification(notificationUser);
            ilcdUser.setQntdNotificacoes(ilcdUser.getQntdNotificacoes() + 1);
            notificationDao.save(notificationUser);
            userDao.save(ilcdUser);
            notificationManager.fillMsgMANAGER_WAIT_Q_REV(ilcd.getId(), ilcd.getTitle());

            List<User> managers = userDao.findByPerfil("MANAGER");
            for (User manager : managers) {
                Notification notifyManager = SerializationUtils.clone(notificationManager);
                notifyManager.setUser(manager);
                manager.addNotification(notifyManager);
                manager.setQntdNotificacoes(manager.getQntdNotificacoes() + 1);
                userDao.saveAndFlush(manager);
            }

            Map<String, Object> model = new HashMap<String, Object>();
            model.put("ilcdTitle", ilcd.getTitle());
            model.put("date", RegisterController.getDateString());
            model.put("ilcdUser", ilcdUser);
            model.put("urlTrack", Strings.BASE + "/login");
            model.put("url", Strings.BASE);
            Mail mail = RegisterController.getMailUtil();
            ilcds = ilcdDao.findIlcdsByLikeEmail(ilcdUser.getEmail());
            HomeController.hasSubmitOrStatus = true;
            mail.sendEmail(ilcdUser.getEmail(), RegisterController.EMAIL_ADMIN, "Submissão de Inventário", model, "emailSubmission.ftl");
            model.put("urlTrack", Strings.BASE + "/admin/ilcd");
            mail.sendEmail(RegisterController.EMAIL_ADMIN, RegisterController.EMAIL_ADMIN, "Submissão de Inventário", model, "emailSubmissionToAdmin.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // TODO: handle exception like RegisterException
            throw new Exception("Ocorreu um erro ao submeter o inventário", e);
        }

        return "redirect:" + Strings.BASE;
    }

    @PostMapping("/ilcd/newAdjust/{id}") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
            @RequestParam("fileComplement") MultipartFile fileComplement, @PathVariable("id") Long idStatus,
            RedirectAttributes redirectAttributes) throws Exception {
        if (!file.isEmpty()) {

            try {
                Status userStatus = statusDao.findOne(idStatus);
                Ilcd ilcd = userStatus.getIlcd();
                // Get the file and save it somewhere. 1 is inicial version
                byte[] bytesfile = file.getBytes();
                Path path = Paths.get(Strings.UPLOADED_FOLDER + MD5(bytesfile));

                if (path.toFile().exists()) {
                    redirectAttributes.addFlashAttribute("message", "File exist, not replace.");
                    return "redirect:/admin/ilcd/uploadStatus";
                }
                Files.createDirectory(path);
                Files.write(path.resolve("./ILCD.zip"), bytesfile);
                User ilcdUser = (User) session().getAttribute("user");

                Archive archive = new Archive();
                archive.setStatus(userStatus);

                userStatus.setArchive(archive);
                ilcd.addStatus(userStatus);

                archive.setPathFile(MD5(bytesfile));
                if (!fileComplement.isEmpty()) {
                    File complementFile = new File(path.resolve("./" + Archive.COMPLEMENT + ".zip").toString());
                    ZipOutputStream out = new ZipOutputStream(new FileOutputStream(complementFile));
                    ZipEntry e = new ZipEntry(fileComplement.getOriginalFilename());
                    out.putNextEntry(e);

                    byte[] data = fileComplement.getBytes();
                    out.write(data, 0, data.length);
                    out.closeEntry();
                    out.close();
                }
                Notification notificationManager = new Notification(), notificationUser = new Notification();
                Homologacao homolog = ilcd.getHomologation();
                notificationUser.setUser(ilcd.getUser());
                notificationUser.fillMsgUSER_SUBMISSION(ilcd.getId(), ilcd.getTitle());
                //TODO: refactoring. Every system has this code... Do a statis method to addNotficatioin, setQntdNodificacoes and save user
                ilcdUser.addNotification(notificationUser);
                ilcdUser.setQntdNotificacoes(ilcdUser.getQntdNotificacoes() + 1);
                userDao.save(ilcdUser);

                List<User> managers = userDao.findByPerfil("MANAGER");
                if (userStatus.getPrevious().getType().equals(1)) {
                    notificationManager.fillMsgMANAGER_NEW_SUBMISSION_Q_REV(ilcdUser.getFullName(), ilcd.getTitle(), ilcd.getId());
                } else {
                    notificationManager.fillMsgMANAGER_NEW_SUBMISSION_T_REV(ilcdUser.getFullName(), ilcd.getTitle(), ilcd.getId());
                }

                notificationDao.save(notificationManager);
                for (User manager : managers) {
                    manager.addNotification(notificationManager);
                    notificationManager.setUser(manager);
                    manager.setQntdNotificacoes(manager.getQntdNotificacoes() + 1);
                    userDao.saveAndFlush(manager);
                }
                redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "' ilcd:" + ilcd.getTitle());

                //Pendecia inicial verdadeira
                homolog.setPending(true);

                // Prazo incial de 5 dias
                Date dt = new Date();
                Calendar c = Calendar.getInstance();
                c.setTime(dt);
                c.add(Calendar.DATE, 5);
                dt = c.getTime();
                homolog.setPrazo(dt);

                userStatus.setEndDate(dt);
                homolog.setSubmission(Calendar.getInstance().getTime());

                //salva o último arquivo para a homologacao
                //homolog.setLastArchive( ilcd.getStatus().get(0).getArchive() );
                //salvando homologação outros objetos são salvos e atualizados em cascata
                homologationDao.save(homolog);
                statusDao.save(userStatus);
                //ilcdUser.addHomologacao(homolog);
                ilcdUser.setQntdNotificacoes(ilcdUser.getQntdNotificacoes() + 1);
                userDao.save(ilcdUser);

            } catch (Exception e) {
                // TODO: handle exception like RegisterException
                throw new Exception("Ocorreu um erro ao submeter o inventário", e);
            }
            return "redirect:" + Strings.BASE;
        }
        redirectAttributes.addFlashAttribute("message", "Nenhum arquivo ILCD adicionado");
        return "redirect:/admin/ilcd/uploadStatus";
    }

    @RequestMapping(value = "/ilcd/{MD5_folder}", method = RequestMethod.GET)
    public void getFile(
            @PathVariable("MD5_folder") String MD5folder,
            HttpServletResponse response, HttpServletRequest request) {
        try {
            String fileName = request.getParameter("name");
            File fileToDownload = new File(Strings.UPLOADED_FOLDER + MD5folder + "/" + fileName);
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
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            IOUtils.copy(inputStream, response.getOutputStream());
            response.flushBuffer();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ilcds = null;
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        //You can redirect wherever you want, but generally it's a good practice to show login screen again.
        return "redirect:/login?logout=true";
    }

    public String MD5(byte[] md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5);
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    //TODO: this method will be refact. It deal about reading files ILCD's.
    public static void zipToIlcd(String path, Ilcd ilcd) throws UnsupportedEncodingException, IOException {

        User user = (User) session().getAttribute("user");
        Archive archive = new Archive();
        archive.setStatus(ilcd.getStatus().get(0));
        //TODO: make a comparator to order list by version
        ilcd.getStatus().get(0).setArchive(archive);
        ilcd.setUuid("");
        //ilcd.setName("");
        ilcd.setUser(user);
//        Ilcd ilcd = new Ilcd(id, name, type, location, classification, new Date(), new Date(), new File(path).getName(), user, 1L, 1L);
//        return ilcd;
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

    public static boolean isPasswordMatching(String passwordHashBd, String password, String hashSalt) {
        password = Password.getEncryptedPassword(password, hashSalt);

        return password.equals(passwordHashBd);
    }

  //@TODO: Validate ilcd if exist     
    @RequestMapping(value = "/getILCD", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody
    String getILCD(@RequestParam("file") MultipartFile file) {
    	
    	try {
    		byte[] bytesfile = file.getBytes();
    		Path path = Paths.get(Strings.UPLOADED_FOLDER + MD5(bytesfile));
    		
    		if (path.toFile().exists()) {
    			return "true";
    		}
    		else {
    			return "false";
    		}
			
		} catch (Exception e) {
			return "false";
		}
    }
    
    @RequestMapping(value = "/matchPasswordUser", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody
    String getUser(@RequestParam("plainPass") String plainPass) {
    	User user = (User) session().getAttribute("user");
        if (user.getPlainPassword().equals(plainPass)) {
            return "true";
        } else {
            return "false";
        }
    }
}
