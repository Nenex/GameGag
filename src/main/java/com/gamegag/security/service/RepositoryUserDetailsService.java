package com.gamegag.security.service;

import com.gamegag.security.dto.ExampleUserDetails;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserConnectionRepository;
import com.gamegag.user.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * This class loads the requested user by using a Spring Data JPA repository.
 * @author Petri Kainulainen
 */
public class RepositoryUserDetailsService implements UserDetailsService {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepositoryUserDetailsService.class);
    @Autowired private UserConnectionRepository repository_connection;
    private UserRepository repository;

    @Autowired
    public RepositoryUserDetailsService(UserRepository repository) {
        this.repository = repository;
    }

    /**
     * Loads the user information.
     * @param username  The username of the requested user.
     * @return  The information of the user.
     * @throws UsernameNotFoundException    Thrown if no user is found with the given username.
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        LOGGER.debug("Loading user by username: {}", username);

        User user = repository.findByEmail(username);
        LOGGER.debug("Found user: {}", user);        
        String urlImage = repository_connection.findByUserId(username).getImageUrl();
        LOGGER.info("USERNAME : " + username);
        LOGGER.info("IMAGE : " + urlImage);
        
        
        if (user == null) {
            throw new UsernameNotFoundException("No user found with username: " + username);
        }
       
        ExampleUserDetails principal = ExampleUserDetails.getBuilder()
                .firstName(user.getFirstName())
                .id(user.getId())
                .lastName(user.getLastName())
                .password(user.getPassword())
                .role(user.getRole())
                .urlImage(urlImage)
                .socialSignInProvider(user.getSignInProvider())
                .username(user.getEmail())
                .build();

        LOGGER.debug("Returning user details: {}", principal);

        return principal;
    }
}
