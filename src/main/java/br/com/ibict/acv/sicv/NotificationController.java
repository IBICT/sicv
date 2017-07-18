package br.com.ibict.acv.sicv;

import static br.com.ibict.acv.sicv.AdminController.session;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author deivdy
 */

@Controller
@RequestMapping("/notification")
public class NotificationController {
    
    @RequestMapping("/teste.json")
    @ResponseBody
    public String root(Map<String, Object> model) {
        return "TESTE";
    }
    
}
