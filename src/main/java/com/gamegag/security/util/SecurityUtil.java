package com.gamegag.security.util;

import com.gamegag.security.dto.ExampleUserDetails;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserConnectionRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author Petri Kainulainen
 */
public class SecurityUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(SecurityUtil.class);
    @Autowired private  static UserConnectionRepository repository_connection;
    
    public static void logInUser(User user) {
        LOGGER.info("Logging in user: {}", user);
        //String urlImage = repository_connection.findByUserId(user.getEmail()).getImageUrl();
               
        ExampleUserDetails userDetails = ExampleUserDetails.getBuilder()
                .firstName(user.getFirstName())
                .id(user.getId())
                .lastName(user.getLastName())
                .password(user.getPassword())
                .role(user.getRole())
                .socialSignInProvider(user.getSignInProvider())
                .username(user.getEmail())
                .urlImage("")
                .build();
        LOGGER.debug("Logging in principal: {}", userDetails);

        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        LOGGER.info("User: {} has been logged in.", userDetails);
    }
}
