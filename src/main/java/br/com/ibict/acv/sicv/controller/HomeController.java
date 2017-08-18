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
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.tomcat.util.http.fileupload.IOUtils;
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

import com.google.gson.GsonBuilder;

import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import br.com.ibict.acv.sicv.util.ExclStrat;
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
    
    @RequestMapping("/403")
    public String deniedAccess(Map<String, Object> model) {
        return "/403";
    }
    
    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String login(Map<String, Object> model) {
        return "home/login";
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
            @RequestParam("json") String json,
            RedirectAttributes redirectAttributes) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/admin/ilcd/uploadStatus";
        }

        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(Strings.UPLOADED_FOLDER + MD5(bytes));

            if (path.toFile().exists()) {
                redirectAttributes.addFlashAttribute("message", "File exist, not replace.");
                return "redirect:/admin/ilcd/uploadStatus";
            }
            Files.write(path, bytes);
            
            Ilcd ilcd = zipToIlcd(path.toString());;
            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "' ilcd:" + ilcd.getName());
            ilcd.setJson1(json);
            ilcdDao.save(ilcd);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:"+Strings.BASE+"/ilcd";
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
    
    @RequestMapping("/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth != null){    
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

    public static Ilcd zipToIlcd(String path) throws UnsupportedEncodingException, IOException {

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
        Ilcd ilcd = new Ilcd(id, name, type, location, classification, new Date(), new Date(), new File(path).getName(), user, 1L, 1L);
        return ilcd;
    }
    
    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }
    
}
