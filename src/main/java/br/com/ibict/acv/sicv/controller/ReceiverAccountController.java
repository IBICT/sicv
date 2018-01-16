package br.com.ibict.acv.sicv.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReceiverAccountController {
    
    @RequestMapping("/receiver")
    public String root(Map<String, Object> model) {
        return "receiver/index";
    }
    
    @PostMapping("/receiver")
    @ResponseBody
    public String action(Map<String, Object> model,
            @RequestParam("email") String email) {
        return email;
    }
    
}
