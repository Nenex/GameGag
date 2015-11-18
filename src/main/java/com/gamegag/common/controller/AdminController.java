package com.gamegag.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamegag.app.repository.PostRepository;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;
import com.gamegag.user.model.Role;
@Controller
public class AdminController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
    protected static final String VIEW_NAME_ADMIN_HOMEPAGE = "admin/home";
    protected static final String VIEW_NAME_ADMIN_MANAGE_ROLE = "admin/manage";
    protected static final String VIEW_NAME_ADMIN_ROLE_LIST = "admin/list";
    @Autowired private PostRepository repository_app;
    @Autowired private UserRepository repository_user;
    
    @RequestMapping(value="/admin", method = RequestMethod.GET)
    public String showAdminHomePage(Model model) {
    	try{
			List<User> user = repository_user.findAll(); 
			LOGGER.debug(repository_user.toString());
	    	model.addAttribute("user", user);
    	}catch(Exception e){
    		LOGGER.debug(e.toString());
		}
    	LOGGER.debug("Rendering admin page.");
        return VIEW_NAME_ADMIN_HOMEPAGE;
    }
    
    @RequestMapping(value="/admin/manage", method = RequestMethod.GET)
    public String showAdminManagePage(HttpServletRequest request, Model model) {
    	Long id 	= Long.parseLong(request.getParameter("id"),10);
        String role = request.getParameter("role");
        String person = request.getParameter("person");
        
    	model.addAttribute("role", Role.values());
    	model.addAttribute("id", id);
    	model.addAttribute("user_role", role);
    	model.addAttribute("person", person);
    	LOGGER.debug("Rendering admin manage page with id: "+id +" and role : " +role);
    	
    	
    	return VIEW_NAME_ADMIN_MANAGE_ROLE;
    }
    
    @RequestMapping(value="/admin/manage", method = RequestMethod.POST)
    public String showAdminresponsePage(HttpServletRequest request) {
    	Long id 	= Long.parseLong(request.getParameter("id"),10);
        String role = request.getParameter("role");
        User user = repository_user.findOne(id);
        user.setRole(role);
        repository_user.save(user);
    	return "redirect:/admin";
    }
    
    @RequestMapping(value="/admin/list", method = RequestMethod.GET)
    public String showAdminListPage() {
    	LOGGER.debug("Rendering admin list page.");
    	return VIEW_NAME_ADMIN_ROLE_LIST;
    }
}
