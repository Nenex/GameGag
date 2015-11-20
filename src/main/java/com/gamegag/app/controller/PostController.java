package com.gamegag.app.controller;

import java.security.Principal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;

import com.gamegag.app.editor.CategoryEditor;
import com.gamegag.app.model.Category;
import com.gamegag.app.model.Post;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;
import com.gamegag.common.controller.HomeController;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;


@Controller
public class PostController {
	
	@Autowired private CategoryRepository repo_category;
	@Autowired private PostRepository repo_post;
	@Autowired private UserRepository repo_user;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    binder.registerCustomEditor(Category.class, new CategoryEditor());
	}
	
    @RequestMapping(value = "/public/post/add", method = RequestMethod.GET)
    public String viewLogin(Map<String, Object> model) {
    	LOGGER.debug("Rendering P page.");
        Post post = new Post();
        model.put("postForm", post);
        model.put("categoryList", repo_category.findAll());
        return "/public/post/create";
    }
 
    @RequestMapping(value = "/public/post/add", method = RequestMethod.POST)
    public String doLogin(HttpServletRequest request,Principal principal) {
	    try {
	    	Post p = new Post();
	    	p.setCategory(repo_category.findOne(Long.parseLong(request.getParameter("id_category"))));
	    	p.setTitle(request.getParameter("title"));
	    	p.setDescription(request.getParameter("description"));
	    	p.setUser(repo_user.findOne(Long.parseLong(request.getParameter("user_id"),10)));
	    	p.setCreationTime(new DateTime());
	    	p.setValidation(false);
	    	p.setFilename("photo.url");
	        repo_post.saveAndFlush(p);
	        return "/public";
	    }catch(Exception e){
	    	LOGGER.debug(e.getMessage());
	    	return "/public";
	    }    	
    }
}

