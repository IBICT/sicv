/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.SolicitacaoDao;
import br.com.ibict.acv.sicv.repositories.UserDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import resources.Strings;

/**
 *
 * @author deivdy
 */
@Controller
@RequestMapping("/admin/ilcd")
public class IlcdController {

    @Autowired
    private IlcdDao ilcdDao;

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private SolicitacaoDao solicitacaoDao;
    
    @Autowired
    private HomologacaoDao homologacaoDao;
    

    @RequestMapping("")
    public String list(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "ilcd/list";
        }
    }

    @RequestMapping("/new")
    public String form(Map<String, Object> model) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            return "ilcd/form";
        }
    }
    
    @RequestMapping("/homologacao/{id}")
    public String homologacao(Map<String, Object> model, @PathVariable("id") String id) {
        if (session().getAttribute("user") == null) {
            return "login/login";
        } else {
            model.put("user", session().getAttribute("user"));
            model.put("ilcd", id);
            return "ilcd/homologacao";
        }
    }
    
    @PostMapping("/teste")
    @ResponseBody
    public String teste(@RequestParam("user") Long userID, @RequestParam("ilcd") String ilcdID) {
        System.out.println("TESTE");
        
        User user = userDao.findOne(userID);
        Ilcd ilcd = ilcdDao.findById(ilcdID);
        
        Homologacao homologacao = new Homologacao();
        homologacao.setUser(user);
        homologacao.setStatus(1);
        homologacao.setLastModifier(new Date());
        homologacaoDao.save(homologacao);
        ilcd.setHomologacao(homologacao);
        ilcdDao.save(ilcd);
        
        return "true";
    }
    
    @RequestMapping(value = "/revisor-qualidade.json", method = RequestMethod.GET)
    @ResponseBody
    String getRevisorQuilidade() {
        Iterable<User> users;
        try {
            users = userDao.findByPerfil("REVISOR DE QUALIDADE");
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(users);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }

    @PostMapping("/new") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("json") String json, @RequestParam("json") String id,
            RedirectAttributes redirectAttributes) {

        

        return "redirect:/admin/ilcd";
    }
    
    @RequestMapping(value = "/files/{file_name}", method = RequestMethod.GET)
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

    @RequestMapping(value = "/ilcd.json", method = RequestMethod.GET)
    @ResponseBody
    String getJSON() {
        Iterable<Ilcd> ilcds;
        try {
            ilcds = ilcdDao.findAll();
        } catch (Exception ex) {
            return "User not found";
        }
        String returnStr = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(ilcds);
        returnStr = returnStr.substring(0, returnStr.length());
        returnStr = "{ \"data\" : " + returnStr + " }";
        return returnStr;
    }
    
    @GetMapping("/uploadStatus")
    public String uploadStatus() {
        return "uploadStatus";
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
            if (entry.getName().startsWith("ILCD/processes/") && entry.getName().endsWith(".xml")) {
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
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }
    
}
