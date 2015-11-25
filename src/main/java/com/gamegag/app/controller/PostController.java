package com.gamegag.app.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamegag.app.model.Comment;
import com.gamegag.app.model.Post;
import com.gamegag.app.model.Vote;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.CommentRepository;
import com.gamegag.app.repository.PostRepository;
import com.gamegag.app.repository.VoteRepository;
import com.gamegag.common.controller.HomeController;
import com.gamegag.dropzone.model.UploadedFile;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;

@Controller
public class PostController {

	@Autowired
	private CategoryRepository repo_category;
	@Autowired
	private PostRepository repo_post;
	@Autowired
	private UserRepository repo_user;
	@Autowired
	private VoteRepository repo_vote;
	@Autowired
	private CommentRepository repo_comment;

	public Long IdInserted;

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
	public @ResponseBody Long doLogin(HttpServletRequest request, Principal principal) {
		try {
			Post p = new Post();
			p.setCategory(repo_category.findOne(Long.parseLong(request.getParameter("id_category"))));
			p.setTitle(request.getParameter("title"));
			p.setDescription(request.getParameter("description"));
			p.setUser(repo_user.findOne(Long.parseLong(request.getParameter("user_id"), 10)));
			p.setCreationTime(new DateTime());
			p.setValidation(false);
			p.setFilename("photo.url");
			repo_post.save(p);
			Long idInserted = p.getId();
			this.IdInserted = idInserted;
			return idInserted;

		} catch (Exception e) {
			LOGGER.debug(e.getMessage());
			return 1432L;
		}
	}

	@RequestMapping(value = "/public/post/details/{id}", method = RequestMethod.GET)
	public String viewDetailsPost(Model model, @PathVariable Long id) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User userConnected = repo_user.findByEmail(name);       
    	LOGGER.debug("Rendering Post details page.");
        Post post = repo_post.findOne(id);
        Vote vote = repo_vote.findOneByPostAndUser(post,userConnected);
        List<Comment> comments = repo_comment.findAllByIdPost(post);
        if(vote != null){
        	model.addAttribute("userVote", vote.getVote());
        }
        model.addAttribute("post", post);
        model.addAttribute("voteplus", repo_vote.getVotePlusBy(post));
        model.addAttribute("votemoins", repo_vote.getVoteMoinsBy(post));
        model.addAttribute("comments",repo_comment.findAllByIdPost(post));
        model.addAttribute("comments",comments);
        return "/public/post/details";
	}
	
    @RequestMapping(value="/public/post/vote/{id}/{userVote}", method = RequestMethod.GET)
    @ResponseBody
    public String updateVote( @PathVariable Long id,@PathVariable Boolean userVote) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User userConnected = repo_user.findByEmail(name);
        
        Post post = repo_post.findOne(id);        
        Vote vote = repo_vote.findOneByPostAndUser(post,userConnected);
        if(vote != null){
        	if(vote.getVote() == true){
        		vote.setVote(false);
        	}else {
        	
        		vote.setVote(true);
        	}
        	repo_vote.save(vote);
        }else{        	
        	vote = new Vote();
        	vote.setId((long) 0);
        	vote.setUser(userConnected);
        	vote.setPost(post);
        	vote.setVote(userVote); 
        	repo_vote.save(vote);
        }    
        Map<String,String> myMap = new HashMap<String, String>();
        //myMap.put("voteplus", repo_vote.getVotePlusBy(post).toString());
        //myMap.put("votemoins",repo_vote.getVoteMoinsBy(post).toString());
        myMap.put("value",userVote.toString());
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
    	 
        try {
            json = mapper.writeValueAsString(myMap);
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return json;  
    }
}
