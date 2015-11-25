package com.gamegag.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamegag.common.controller.HomeController;
import com.gamegag.user.dto.PostForm;
import com.gamegag.user.dto.ProfilForm;
import com.gamegag.user.model.Comment;
import com.gamegag.user.model.Post;
import com.gamegag.user.model.User;
import com.gamegag.user.model.Vote;
import com.gamegag.user.repository.CategoryRepository;
import com.gamegag.user.repository.CommentRepository;
import com.gamegag.user.repository.PostRepository;
import com.gamegag.user.repository.UserRepository;
import com.gamegag.user.repository.VoteRepository;

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

	@RequestMapping(value = "/user/post/add", method = RequestMethod.GET)
	public String viewLogin(Map<String, Object> model) {
		LOGGER.debug("Rendering P page.");
		Post post = new Post();
		model.put("postForm", post);
		model.put("categoryList", repo_category.findAll());
		return "/user/post/create";
	}

	@RequestMapping(value = "/user/post/add", method = RequestMethod.POST)
	public @ResponseBody Long doLogin(@Valid @ModelAttribute(value = "post") PostForm post,
			BindingResult result, HttpServletRequest request, Principal principal) {
		JsonResponse res = new JsonResponse();
		
		ValidationUtils.rejectIfEmpty(result, "titel", "titel can not be empty.");
		ValidationUtils.rejectIfEmpty(result, "description", "description can not be empty.");
		
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

	@RequestMapping(value = "/user/post/details/{id}", method = RequestMethod.GET)
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
        return "/user/post/details";
	}
	
    @RequestMapping(value="/user/post/vote/{id}/{userVote}", method = RequestMethod.GET)
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
