package com.gamegag.user.controller;

import com.gamegag.security.util.SecurityUtil;
import com.gamegag.user.dto.RegistrationForm;
import com.gamegag.user.model.SocialMediaService;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;
import com.gamegag.user.service.DuplicateEmailException;
import com.gamegag.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionKey;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * @author Petri Kainulainen
 */
@Controller
@SessionAttributes("user")
public class RegistrationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RegistrationController.class);

    protected static final String ERROR_CODE_EMAIL_EXIST = "NotExist.user.email";
    protected static final String MODEL_NAME_REGISTRATION_DTO = "user";
    protected static final String VIEW_NAME_REGISTRATION_PAGE = "user/registrationForm";

    private UserService service;
    @Autowired
    private UserRepository repository_user;

    @Autowired
    public RegistrationController(UserService service) {
        this.service = service;
    }

    /**
     * Renders the registration page.
     */
    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public String showRegistrationForm(WebRequest request, Model model) {
        LOGGER.debug("Rendering registration page.");

        @SuppressWarnings("deprecation")
		Connection<?> connection = ProviderSignInUtils.getConnection(request);

        RegistrationForm registration = createRegistrationDTO(connection);
        LOGGER.debug("Rendering registration form with information: {}", registration);

        model.addAttribute(MODEL_NAME_REGISTRATION_DTO, registration);
        return VIEW_NAME_REGISTRATION_PAGE;
    }

    /**
     * Creates the form object used in the registration form.
     * @param connection
     * @return  If a user is signing in by using a social provider, this method returns a form
     *          object populated by the values given by the provider. Otherwise this method returns
     *          an empty form object (normal form registration).
     */
    private RegistrationForm createRegistrationDTO(Connection<?> connection) {
        RegistrationForm dto = new RegistrationForm();

        if (connection != null) {
            UserProfile socialMediaProfile = connection.fetchUserProfile();
            dto.setEmail(socialMediaProfile.getEmail());
            dto.setFirstName(socialMediaProfile.getFirstName());
            dto.setLastName(socialMediaProfile.getLastName());

          LOGGER.debug("===================== --- "+socialMediaProfile.getEmail());
            ConnectionKey providerKey = connection.getKey();
            dto.setSignInProvider(SocialMediaService.valueOf(providerKey.getProviderId().toUpperCase()));
            LOGGER.debug("===================== --- "+socialMediaProfile.getEmail());
        }

        return dto;
    }

    /**
     * Processes the form submissions of the registration form.
     */
    @RequestMapping(value ="/user/register", method = RequestMethod.POST)
    public String registerUserAccount(@Valid @ModelAttribute("user") RegistrationForm userAccountData,
                                      BindingResult result,
                                      WebRequest request) throws DuplicateEmailException {
        LOGGER.debug("Registering user account with information: {}", userAccountData);
        if (result.hasErrors()) {
            LOGGER.debug("Validation errors found. Rendering form view.");
            return VIEW_NAME_REGISTRATION_PAGE;
        }

        LOGGER.debug("No validation errors found. Continuing registration process.");

        User registered = createUserAccount(userAccountData, result);

        //If email address was already found from the database, render the form view.
        if (registered == null) {
            LOGGER.debug("An email address was found from the database. Rendering form view.");
            return VIEW_NAME_REGISTRATION_PAGE;
        }

        LOGGER.debug("Registered user account with information: {}", registered);

        //Logs the user in.
        SecurityUtil.logInUser(registered);
        LOGGER.debug("User {} has been signed in", registered);
        //If the user is signing in by using a social provider, this method call stores
        //the connection to the UserConnection table. Otherwise, this method does not
        //do anything.
        ProviderSignInUtils.handlePostSignUp(registered.getEmail(), request);

        return "redirect:/";
    }
    
    @RequestMapping(value = "/public/user/savePassword", method = RequestMethod.GET)
  
    public String test() {
    	
        return "public/test";
    }
    
   /* @RequestMapping(value = "/public/user/savePassword", method = RequestMethod.POST)
    public String savePassword(HttpServletRequest request) {
    	LOGGER.debug("post reset");
    	String password = request.getParameter("password");
    	
    	System.out.println("coucou det");
    	UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("coucou user");
    	System.out.println(userDetails.getUsername());
    	User user = repository_user.findByEmail(userDetails.getUsername());
    	user = service.changeUserPassword(user, password);
        
        return "/index";
    }*/
    

    /**
     * Creates a new user account by calling the service method. If the email address is found
     * from the database, this method adds a field error to the email field of the form object.
     */
    private User createUserAccount(RegistrationForm userAccountData, BindingResult result) {
        LOGGER.debug("Creating user account with information: {}", userAccountData);
        User registered = null;

        try {
            registered = service.registerNewUserAccount(userAccountData);
        }
        catch (DuplicateEmailException ex) {
            LOGGER.debug("An email address: {} exists.", userAccountData.getEmail());
            addFieldError(
                    MODEL_NAME_REGISTRATION_DTO,
                    RegistrationForm.FIELD_NAME_EMAIL,
                    userAccountData.getEmail(),
                    ERROR_CODE_EMAIL_EXIST,
                    result);
        }

        return registered;
    }

    private void addFieldError(String objectName, String fieldName, String fieldValue,  String errorCode, BindingResult result) {
        LOGGER.debug(
                "Adding field error object's: {} field: {} with error code: {}",
                objectName,
                fieldName,
                errorCode
        );
        FieldError error = new FieldError(
                objectName,
                fieldName,
                fieldValue,
                false,
                new String[]{errorCode},
                new Object[]{},
                errorCode
        );

        result.addError(error);
        LOGGER.debug("Added field error: {} to binding result: {}", error, result);
    }
}
