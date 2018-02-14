package br.com.ibict.acv.sicv.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import resources.Strings;
import br.com.ibict.acv.sicv.CustomAuthProvider;
import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Status;
import br.com.ibict.acv.sicv.model.TechnicalReviewer;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.HomologacaoDao;
import br.com.ibict.acv.sicv.repositories.IlcdDao;
import br.com.ibict.acv.sicv.repositories.QualiDataDao;
import br.com.ibict.acv.sicv.repositories.StatusDao;
import br.com.ibict.acv.sicv.repositories.TechnicalReviewerDao;

import com.google.gson.Gson;
import java.util.Collections;

/**
 *
 * @author deivdywilliamsilva
 */
@Controller
@RequestMapping("/technicalreview")
public class technicalReviewController {

    @Autowired
    private IlcdDao ilcdDao;

    @Autowired
    private StatusDao statusDao;

    @Autowired
    private HomologacaoDao homologacaoDao;

    @Autowired
    private QualiDataDao qualiDataDao;

    @Autowired
    private TechnicalReviewerDao technicalReviewerDao;

    @RequestMapping(value = {"", "/"})
    public String index(Map<String, Object> model) {
        User user = (User) session().getAttribute("user");
        String name = user.getFirstName();
        model.put("username", name);

        List<Status> invites = statusDao.findByRevisorAndAcceptAndType(user, null, 2);
        model.put("invite", invites);

        List<Status> works = statusDao.findByRevisorAndAcceptAndType(user, true, 2);
        model.put("work", works);
        return "technicalreview/index";
    }

    @RequestMapping(value = {"accept/{id}/", "/accept/{id}/", "accept/{id}", "/accept/{id}"})
    public String accept(Map<String, Object> model, @PathVariable("id") Long id) {
        try {

            Status status = statusDao.findOne(id);
            status.setAccept(true);
            status.setRequestDate(new Date());
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 5);
            status.setExpectedDate(calendar.getTime());
            statusDao.save(status);

            Homologacao homo = status.getIlcd().getHomologation();
            homo.setStatus(2);
            homologacaoDao.save(homo);
            return "redirect:/technicalreview/" + status.getId();
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"refuse/{id}/", "/refuse/{id}/", "refuse/{id}", "/refuse/{id}"})
    public String refuse(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            Status status = statusDao.findOne(id);
            status.setAccept(false);
            statusDao.save(status);
            return "redirect:/technicalreview/" + status.getId();
        } catch (Exception e) {
            return "error";
        }
    }

    // TODO: resolver url path
    @RequestMapping(value = {"/{id}/", "{id}/", "{id}", "/{id}"})
    public String itemDeteil(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            model.put("username", name);
            // TODO: Alterara status1 para statusSelecionado
            Status status1 = statusDao.findOne(id);
            model.put("status1", status1);
            Ilcd ilcd = status1.getIlcd();
            model.put("ilcd", ilcd);
            // TODO: Alterara status1 para statusHistorico
            List<Status> status2 = statusDao.findByIlcdAndType(ilcd, 2);
            Collections.reverse(status2);
            model.put("status2", status2);
            return "technicalreview/item";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{id}/review", "/{id}/review/"})
    public String itemReview(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            Status status1 = statusDao.findOne(id);
            TechnicalReviewer technicalReviewer2 = null;
            if (status1.getId() > 2) {
                technicalReviewer2 = statusDao.findOne(status1.getId() - 1).getTechnicalReviewer();
            }
            TechnicalReviewer technicalReviewer1 = status1.getTechnicalReviewer();
            model.put("technicalReviewer1", technicalReviewer1);
            model.put("technicalReviewer2", technicalReviewer2);
            model.put("username", name);
            model.put("status", status1);
            return "technicalreview/review";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"/{id}/review", "/{id}/review/"}, method = RequestMethod.POST)
    public String reviewAction(Map<String, Object> model, @PathVariable("id") Long id, @RequestParam Map<String, String> allRequestParams, @RequestParam("file") MultipartFile file) {
        try {

            
            Status status = statusDao.findOne(id);
            Gson gson = new Gson();
            
            TechnicalReviewer technicalReviewer = gson.fromJson(allRequestParams.get("json"), TechnicalReviewer.class);
            if (allRequestParams.containsKey("result"))
                status.setResult(new Integer(allRequestParams.get("result")));
            
            if( !file.isEmpty() ){
                Path path = Paths.get(Strings.UPLOADED_FOLDER + status.getArchive().getPathFile());
            	File complementFile = new File(path.resolve("./" + "reviewAttachment"+".zip").toString() );
            	ZipOutputStream out = new ZipOutputStream(new FileOutputStream(complementFile));
            	ZipEntry e = new ZipEntry( file.getOriginalFilename() );
            	out.putNextEntry(e);

            	byte[] data = file.getBytes();
            	out.write(data, 0, data.length);
            	out.closeEntry();
            	out.close();
                technicalReviewer.setAttachment(true);
            } else {
                technicalReviewer.setAttachment(false);
            }
            technicalReviewerDao.save(technicalReviewer);
            status.setTechnicalReviewer(technicalReviewer);
            
            status.setEndDate(new Date());
            if(allRequestParams.get("tipo").equals("2")){
               status.setClosed(true);
               statusDao.save(status);
               return "redirect:/technicalreview/"+status.getId();
            } else {
                status.setClosed(false);
                statusDao.save(status);
                return "redirect:/technicalreview/"+status.getId();
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return "ERRO 500";
        }
    }
    
    @RequestMapping(value = {"/{id}/view", "/{id}/view/"})
    public String reviewView(Map<String, Object> model, @PathVariable("id") Long id) {
        try {
            User user = (User) session().getAttribute("user");
            String name = user.getFirstName();
            Status status1 = statusDao.findOne(id);
            TechnicalReviewer technicalReviewer1 = status1.getTechnicalReviewer();
            model.put("technicalReviewer1", technicalReviewer1);
            model.put("username", name);
            model.put("status", status1);
            return "technicalreview/view";
        } catch (Exception e) {
            return "error";
        }
    }

    public static HttpSession session() {
        return CustomAuthProvider.getHttpSession();
    }

}
