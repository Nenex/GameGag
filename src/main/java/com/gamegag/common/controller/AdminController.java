package com.gamegag.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    protected static final String VIEW_NAME_ADMIN_HOMEPAGE = "admin/home";
    protected static final String VIEW_NAME_ADMIN_MANAGE_ROLE = "admin/manage";
    protected static final String VIEW_NAME_ADMIN_ROLE_LIST = "admin/list";

    @RequestMapping(value="/admin", method = RequestMethod.GET)
    public String showAdminHomePage() {
        return VIEW_NAME_ADMIN_HOMEPAGE;
    }
    
    @RequestMapping(value="/admin/manage", method = RequestMethod.GET)
    public String showAdminManagePage() {
    	return VIEW_NAME_ADMIN_MANAGE_ROLE;
    }
    
    @RequestMapping(value="/admin/list", method = RequestMethod.GET)
    public String showAdminListPage() {
    	return VIEW_NAME_ADMIN_ROLE_LIST;
    }
}
