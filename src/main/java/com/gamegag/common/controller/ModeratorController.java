package com.gamegag.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ModeratorController {

    protected static final String VIEW_NAME_MOD_HOMEPAGE = "moderator/home";
    protected static final String VIEW_NAME_MOD_MANAGE_POST = "moderator/manage";

    @RequestMapping(value="/moderator", method = RequestMethod.GET)
    public String showAdminHomePage() {
        return VIEW_NAME_MOD_HOMEPAGE;
    }
    
    @RequestMapping(value="/moderator/manage", method = RequestMethod.GET)
    public String showAdminManagePage() {
    	return VIEW_NAME_MOD_MANAGE_POST;
    }
    
}
