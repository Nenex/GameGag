package com.gamegag.common.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.UserDetailsManagerConfigurer.UserDetailsBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamegag.app.model.Post;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;
import com.gamegag.dropzone.controller.FileController;
import com.gamegag.security.dto.ExampleUserDetails;
import com.gamegag.security.service.RepositoryUserDetailsService;
import com.gamegag.user.model.User;
import com.gamegag.user.model.UserConnection;
import com.gamegag.user.repository.UserConnectionRepository;
import com.gamegag.user.repository.UserRepository;

@Controller
public class HomeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    protected static final String VIEW_NAME_HOMEPAGE = "index";
    protected static final String VIEW_NAME_PUBLIC = "public/index";
    protected static final String VIEW_NAME_ERROR_403 = "public/403";
    protected static final String VIEW_PUBLIC_PROFIL = "public/profil";
    protected static final String VIEW_PUBLIC_PROFIL_EDIT = "public/edit";

    @Autowired private PostRepository _PostRepo;
    @Autowired private CategoryRepository _CategoryRepo;
    @Autowired private UserRepository repository_user;
   
 
    
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
    
    @RequestMapping(value="/public/profil", method = RequestMethod.GET)
    public String showPublicProfilPage(Model model) {
    	LOGGER.debug("Rendering public profil page.");
    	//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	//if (!(auth instanceof AnonymousAuthenticationToken)) {
    	//}
    	UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		final User user = repository_user.findByEmail(userDetails.getUsername());
		//model.addAttribute("id",user.getId());
    	
		FileController file = new FileController("profil");
        
        model.addAttribute("fileName",file.getFileName(user.getId()));
        model.addAttribute("firstName",user.getFirstName());
        model.addAttribute("lastName",user.getLastName());
        
        return VIEW_PUBLIC_PROFIL;
    }
    
    @RequestMapping(value="/public/profil/edit", method = RequestMethod.GET)
    public String showPublicProfilEditPage(HttpServletRequest request,Model model) {
    	//Long id 	= Long.parseLong(request.getParameter("id"),10);
    	LOGGER.debug("Rendering public profil edit page.");
    	UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		final User user = repository_user.findByEmail(userDetails.getUsername());
		//model.addAttribute("id",user.getId());
    	
		FileController file = new FileController("profil");
        
        model.addAttribute("fileName",file.getFileName(user.getId()));
        model.addAttribute("firstName",user.getFirstName());
        model.addAttribute("lastName",user.getLastName());
        
    	return VIEW_PUBLIC_PROFIL_EDIT;
    }
    
    @RequestMapping(value = "/public/profil", method = RequestMethod.POST)
	public @ResponseBody Long doLogin(HttpServletRequest request) {
		try {
			UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			final User user = repository_user.findByEmail(userDetails.getUsername());
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			
			user.setFirstName(firstName);
			user.setLastName(lastName);
			LOGGER.debug("appel edition post");
			repository_user.save(user);
			Long idInserted = user.getId();
			return idInserted;
			
		} catch (Exception e) {
			LOGGER.debug(e.getMessage());
			return 1432L;
		}
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
