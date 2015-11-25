package com.gamegag.user.controller;

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
import org.springframework.security.core.userdetails.UserDetails;
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
import com.gamegag.dropzone.controller.FileController;
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
import com.gamegag.user.service.UserService;

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


	private static final Logger LOGGER = LoggerFactory.getLogger(PostController.class);

	@RequestMapping(value = "/user/post/add", method = RequestMethod.GET)
	public String viewLogin(Map<String, Object> model,Model modelM) {
		LOGGER.debug("Rendering P page.");
		
		PostForm dto = new PostForm();
		dto.settitle("");
		dto.setdescription("");
		

		LOGGER.debug("Rendering post add form with information: {}", dto);

		
		
		Post post = new Post();
		modelM.addAttribute("post", dto);
		model.put("postForm", post);
		model.put("categoryList", repo_category.findAll());
		return "/user/post/create";
	}

	@RequestMapping(value = "/user/post/add", method = RequestMethod.POST)
	public @ResponseBody JsonResponse doLogin(@Valid @ModelAttribute(value = "post") PostForm post,
			BindingResult result, HttpServletRequest request) {
		
		JsonResponse res = new JsonResponse();
		LOGGER.debug("entre post add");
		ValidationUtils.rejectIfEmpty(result, "title", "titel can not be empty.");
		ValidationUtils.rejectIfEmpty(result, "description", "description can not be empty.");
		LOGGER.debug("1");
		try {
			if (!result.hasErrors()) {
				UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
						.getPrincipal();
				User user = repo_user.findByEmail(userDetails.getUsername());
				// user = createUserProfil(userProfilData, result);
				String title = post.gettitle();
				String description = post.getdescription();
				Post p = new Post();
				p.setCategory(repo_category.findOne(Long.parseLong(request.getParameter("id_category"))));
				p.setTitle(title);
				p.setDescription(description);
				p.setUser(repo_user.findOne(user.getId()));
				p.setCreationTime(new DateTime());
				p.setValidation(false);
				p.setFilename("");
				repo_post.save(p);
				
				
				res.setStatus("SUCCESS");
				res.setResult(p.getId());

			} else {
				LOGGER.debug("20");
				res.setStatus("FAIL");
				res.setResult(result.getAllErrors());
			}
			LOGGER.debug("30");
		} catch (Exception e) {
			LOGGER.debug(e.getMessage());
			res.setStatus("FAIL");
			res.setResult(1432L);
		}
		return res;
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
