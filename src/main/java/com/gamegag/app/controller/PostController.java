package com.gamegag.app.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gamegag.app.model.Post;
import com.gamegag.app.model.Vote;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;
import com.gamegag.app.repository.VoteRepository;
import com.gamegag.common.controller.HomeController;
import com.gamegag.user.repository.UserRepository;


@Controller
public class PostController {
	
	@Autowired private CategoryRepository repo_category;
	@Autowired private PostRepository repo_post;
	@Autowired private UserRepository repo_user;
	@Autowired private VoteRepository repo_vote;
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	
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
    
    @RequestMapping(value = "/public/post/details/{id}", method = RequestMethod.GET)
    public String viewDetailsPost( Model model, @PathVariable Long id) {
    	LOGGER.debug("Rendering Post details page.");    	
        Post post = repo_post.findOne(id);
        List<Vote> votes = repo_vote.findAllByIdPost(post);
        LOGGER.debug("NB VOTE : " + votes.size());
        model.addAttribute("post", post);
        model.addAttribute("votes", votes);
        return "/public/post/details";
    }
}

