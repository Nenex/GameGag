package com.gamegag.common.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamegag.app.model.Post;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;

@Controller
public class HomeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    protected static final String VIEW_NAME_HOMEPAGE = "index";
    protected static final String VIEW_NAME_PUBLIC = "public/index";
    protected static final String VIEW_NAME_ERROR_403 = "public/403";

    @Autowired private PostRepository _PostRepo;
    @Autowired private CategoryRepository _CategoryRepo;
   
 
    
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String showHomePage() {
        LOGGER.debug("Rendering homepage.");
        return VIEW_NAME_HOMEPAGE;
    }
    
    @RequestMapping(value="/public", method = RequestMethod.GET)
    public String showPublicPage(Model model) {
    	Pageable topTen = new PageRequest(0, 10);
    	List<Post> posts = _PostRepo.findWithPageable(topTen);
    	model.addAttribute("posts", posts);
    	LOGGER.debug(posts.toString());
    	model.addAttribute("categories", _CategoryRepo.findAll());
        LOGGER.debug("Rendering public page.");
        return VIEW_NAME_PUBLIC;
    }
    
    @RequestMapping(value="/403", method = RequestMethod.GET)
    public String showError403Page() {
        LOGGER.debug("Rendering 403 page.");
       // _UserRepo.
        return VIEW_NAME_ERROR_403;
    }
    
    @RequestMapping(value="/public/list/{id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> showLastImage( @PathVariable Long id) {
    	Pageable topFive = new PageRequest(0, 5);
    	List<Post> posts = _PostRepo.findByIdInferiorAt(id, topFive);
    	return posts;
    }
    
    
}
