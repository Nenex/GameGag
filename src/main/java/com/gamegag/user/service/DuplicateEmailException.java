package com.gamegag.user.service;

/**
 * The exception is thrown when the email given during the registration
 * phase is already found from the database.
 * @author Petri Kainulainen
 */
@SuppressWarnings("serial")
public class DuplicateEmailException extends Exception {

    public DuplicateEmailException(String message) {
        super(message);
    }
}
