/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ibict.acv.sicv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author deivdy
 */
@Controller
public class NotFoundController {

    @RequestMapping("/404.html")
    public String render404(Model model) {
        // Add model attributes
        return "404";
    }
}
