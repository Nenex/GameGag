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

import com.gamegag.app.model.Category;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;
import com.gamegag.user.model.Role;
@Controller
public class AdminController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
    protected static final String VIEW_NAME_ADMIN_HOMEPAGE = "admin/index";
    protected static final String VIEW_NAME_ADMIN_MANAGE_CATEGORY = "admin/categories";
    protected static final String VIEW_NAME_ADMIN_MANAGE_ROLE = "admin/manage_role";
    protected static final String VIEW_NAME_ADMIN_USERS_LIST = "admin/users";
    
    @Autowired private PostRepository repository_app;
    @Autowired private UserRepository repository_user;
    @Autowired private CategoryRepository repository_category;
    
    @RequestMapping(value="/admin", method = RequestMethod.GET)
    public String showAdminHomePage(Model model) {
    	LOGGER.debug("Rendering admin index page.");
        return VIEW_NAME_ADMIN_HOMEPAGE;
    }
    
    @RequestMapping(value="/admin/users", method = RequestMethod.GET)
    public String showUserList(Model model) {
    	try{
			List<User> user = repository_user.findAll(); 
			LOGGER.debug(repository_user.toString());
	    	model.addAttribute("user", user);
    	}catch(Exception e){
    		LOGGER.debug(e.toString());
		}
    	LOGGER.debug("Rendering lists user page.");
        return VIEW_NAME_ADMIN_USERS_LIST;
    }
    
    @RequestMapping(value="/admin/categories", method = RequestMethod.GET)
    public String showCategoryList(Model model) {
    	try{
			List<Category> categories = repository_category.findAll(); 
			LOGGER.debug(repository_category.toString());
	    	model.addAttribute("categories", categories);
    	}catch(Exception e){
    		LOGGER.debug(e.toString());
		}
    	LOGGER.debug("Rendering lists categories page.");
        return VIEW_NAME_ADMIN_MANAGE_CATEGORY;
    }
    
    @RequestMapping(value="/admin/manage_role", method = RequestMethod.GET)
    public String showAdminManageRolePage(HttpServletRequest request, Model model) {
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
    
    @RequestMapping(value="/admin/manage_category", method = RequestMethod.GET)
    public String showAdminManageCategoryPage(HttpServletRequest request, Model model) {
    	Long id 	= Long.parseLong(request.getParameter("id"),10);    	
    	model.addAttribute("category",repository_category.findOne(id));
    	LOGGER.debug("Rendering admin manage category page with id: "+id);    	    	
    	return VIEW_NAME_ADMIN_MANAGE_CATEGORY;
    }
    
    @RequestMapping(value="/admin/manage_role", method = RequestMethod.POST)
    public String showAdminresponsePage(HttpServletRequest request) {
    	Long id 	= Long.parseLong(request.getParameter("id"),10);
        String role = request.getParameter("role");
        User user = repository_user.findOne(id);
        user.setRole(role);
        repository_user.save(user);
    	return "redirect:/admin";
    }
    
}
