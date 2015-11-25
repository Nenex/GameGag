package com.gamegag.user.service;

import com.gamegag.user.dto.RegistrationForm;
import com.gamegag.user.model.User;

/**
 * @author Petri Kainulainen
 */
public interface UserService {

    /**
     * Creates a new user account to the service.
     * @param userAccountData   The information of the created user account.
     * @return  The information of the created user account.
     * @throws DuplicateEmailException Thrown when the email address is found from the database.
     */
    public User registerNewUserAccount(RegistrationForm userAccountData) throws DuplicateEmailException;

	public String changeUserPassword(User user, String password);
}
