package br.com.ibict.acv.sicv.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
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
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.model.Archive;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.NotificationDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.ExclStrat;
import br.com.ibict.acv.sicv.util.Mail;
import br.com.ibict.acv.sicv.util.Password;
import resources.Strings;

@Controller
public class HomeController {

    @Autowired
    private UserDao userDao;
    
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
        String name = user.getUserName();
        model.put("isUserLabel", true);
        //model.put("username", name);
        if( ilcds == null || hasSubmitOrStatus){
        	ilcds = ilcdDao.findIlcdsByLikeEmail( user.getEmail() );
        	hasSubmitOrStatus = true;
        }
        model.put("ilcds", ilcds);
        
        return "home/home";
    }
    
    @RequestMapping("/manager")
    public String getRootManager(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getUserName();
        model.put("isUserLabelFalse", true);
        model.put("username", name);
        if( ilcds == null || hasSubmitOrStatus){
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
    public String gatLogin(Map<String, Object> model) {
        return "home/login";
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String getProfileHandler(Map<String, Object> model) {
    	User user = (User) session().getAttribute("user");

    	model.put("user", user);
        return "/profile";
    }
    
    @PostMapping("/profile")
    public String loginHandle(@RequestParam("profile") String profile) {
        
    	User userSession = (User) session().getAttribute("user"); 
    	//profile = profile.replaceAll("\\[", "").replaceAll("\\]","");
    	Gson gson = new Gson();
    	User user = gson.fromJson(profile, User.class);
    	if( user.getPlainPassword().trim() != "" ){
    		if( user.getPlainPassword().equals( userSession.getPlainPassword() ) && !user.getNewPassword().trim().equals("") ){
    			user.setPasswordHashSalt( Password.generateSalt( 20 ) );
    			user.setPasswordHash( Password.getEncryptedPassword( user.getNewPassword() , user.getPasswordHashSalt() ) );
    			user.setPlainPassword( user.getNewPassword() );
    			user.setNewPassword(null);
    		}else
    			user.setPasswordHash( userSession.getPasswordHash() );
    			user.setPlainPassword( userSession.getPlainPassword() );
    	}
    	
    	user.setHomologacoes(userSession.getHomologacoes());
    	user.setStatus(userSession.getStatus());  
    	user.setRoles(userSession.getRoles());
        userDao.save(user);
        session().setAttribute("user",user);
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("successMessage", "Perfil atualizado com sucesso!");
        
        return "successAlterProfile";
    }
    
    @RequestMapping("/authorIlcd/{index}")
    public String getAuthorIlcd(Map<String, Object> model, @PathVariable("index") Integer index) {
    	Ilcd ilcd = ilcds.get(index);
    	model.put("user", (User)session().getAttribute("user"));
    	model.put("ilcd", ilcd);
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
            model.put("user", session().getAttribute("user"));
            return "home/form";
        }
    }

    @PostMapping("/ilcd/new") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
            @RequestParam("json") String json,@RequestParam("ilcd") String jsonIlcd, @RequestParam("authors") String jsonAuthors,
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
            byte[] bytes = file.getBytes();
            Path path = Paths.get(Strings.UPLOADED_FOLDER + MD5(bytes));
            String pathResolve = path.resolve("ILCD.zip").toString();

            if (path.toFile().exists()) {
                redirectAttributes.addFlashAttribute("message", "File exist, not replace.");
                return "redirect:/admin/ilcd/uploadStatus";
            }
            Files.createDirectory(path);
            Files.write(path.resolve("./ILCD.zip"), bytes);
            User ilcdUser = (User) session().getAttribute("user");
            Status status = new Status();
            status.setStatus(1);
            status.setType(1);
            status.setIlcd(ilcd);
            ilcd.addStatus(status);
            
            zipToIlcd(pathResolve, ilcd);
            status.getArchive().setPathFile( MD5(bytes) );
            Notification notification = new Notification();
            Homologacao homolog = new Homologacao();
            notification.setUser( ilcd.getUser().getId() );
            notification.fillMsgWAIT_REV( ilcd.getUuid() , ilcd.getName() );
            notification.setStatus(status);
            notification.setIlcd(ilcd);
            notification.setNotifyDate( Calendar.getInstance().getTime() );
            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "' ilcd:" + ilcd.getName());
            ilcd.setJson1(json);
            ilcd.addNotification(notification);
            homolog.setStatus(1);
            //homolog.setUser( manager );
            homolog.setSubmission( Calendar.getInstance().getTime() );
            homolog.setIlcd(ilcd);
            //salva o último arquivo para a homologacao
            homolog.setLastArchive( ilcd.getStatus().get(0).getArchive() );
            ilcd.setHomologation(homolog);
            //salvando homologação outros objetos são salvos e atualizados em cascata
            homologationDao.saveAndFlush(homolog);
//            ilcdUser.addHomologacao(homolog);
            ilcdUser.setQntdNotificacoes( ilcdUser.getQntdNotificacoes()+ 1 );
            userDao.saveAndFlush(ilcdUser);

            Map<String, Object> model = new HashMap<String, Object>();
            model.put("ilcdName", ilcd.getName());
            model.put("date", RegisterController.getDateString());
            model.put("ilcdUser", ilcdUser);
            model.put("urlTrack", Strings.BASE + "/login");
            model.put("url", Strings.BASE);
            Mail mail = RegisterController.getMailUtil();
            ilcds = ilcdDao.findIlcdsByLikeEmail( ilcdUser.getEmail() );
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
        return "redirect:/login?logout";
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

    public static void zipToIlcd(String path, Ilcd ilcd) throws UnsupportedEncodingException, IOException {

        String id = null;
        String name = null;
        String type = null;
        String location = null;
        String classification = null;
        String referenceYear;
        String dataSetValidUntil;
        ZipFile zipFile = null;
        try {
            zipFile = new ZipFile(path);
        } catch (IOException ex) {
            //return null;
        }
        Enumeration<? extends ZipEntry> entries = zipFile.entries();
        while (entries.hasMoreElements()) {
            ZipEntry entry = entries.nextElement();
            //System.out.println(entry.getName());
            if (entry.getName().startsWith("ILCD/processes/") && (entry.getName().endsWith(".xml")
                    || entry.getName().endsWith(".XML"))) {
                InputStream stream = null;
                try {
                    stream = zipFile.getInputStream(entry);
                } catch (IOException ex) {
                    //return null;
                }
                ByteArrayOutputStream result = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int length;
                try {
                    while ((length = stream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                } catch (IOException ex) {
                    //return null;
                }
                String content = null;
                try {
                    content = result.toString("UTF-8");
                    //System.out.println(content);
                } catch (UnsupportedEncodingException ex) {
                    //return null;
                }

                // Id
                id = content.substring(content.indexOf("<common:UUID"), content.indexOf("</common:UUID>"));
                id = id.substring(id.indexOf('>') + 1);

                // Name
                name = content.substring(content.indexOf("<baseName"), content.indexOf("</name>"));
                String[] temp = name.split("\n");
                name = "";
                for (int i = 0; i < temp.length - 1; i++) {
                    name += temp[i].substring(temp[i].indexOf(">") + 1, temp[i].lastIndexOf("<")) + " ";
                }

                // Type
                type = "";

                // Location
                location = content.substring(content.indexOf("<locationOfOperationSupplyOrProduction"), content.indexOf("</locationOfOperationSupplyOrProduction>"));
                location = location.substring(location.indexOf("location=\"") + 10, location.indexOf("\">"));

                // Classification
                classification = content.substring(content.indexOf("<common:classification"), content.indexOf("</common:classification>"));
                temp = classification.split("\n");
                classification = "";
                for (int i = 1; i < temp.length - 1; i++) {
                    classification += temp[i].substring(temp[i].indexOf(">") + 1, temp[i].lastIndexOf("<")) + " / ";
                }

                // ReferenceYear
                referenceYear = content.substring(content.indexOf("<common:referenceYear"), content.indexOf("</common:referenceYear>"));
                referenceYear = referenceYear.substring(referenceYear.indexOf('>') + 1);

                // DataSetValidUntil
                dataSetValidUntil = content.substring(content.indexOf("<common:dataSetValidUntil"), content.indexOf("</common:dataSetValidUntil>"));
                dataSetValidUntil = dataSetValidUntil.substring(dataSetValidUntil.indexOf('>') + 1);

            }
        }
        User user = (User) session().getAttribute("user");
        Archive archive = new Archive();
        archive.setStatus( ilcd.getStatus().get(0) );
        //TODO: make a comparator to order list by version
        archive.setVersion(1);
        ilcd.getStatus().get(0).setArchive(archive);
        ilcd.setUuid(id);
        ilcd.setName(name);
        ilcd.setUser(user);
//        Ilcd ilcd = new Ilcd(id, name, type, location, classification, new Date(), new Date(), new File(path).getName(), user, 1L, 1L);
//        return ilcd;
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }
    
    public static boolean isPasswordMatching(String passwordHashBd, String password, String hashSalt){
    	password = Password.getEncryptedPassword( password, hashSalt );
    	
    	return password.equals(passwordHashBd);    	
    }

}
