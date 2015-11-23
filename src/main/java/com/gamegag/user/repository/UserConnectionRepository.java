package com.gamegag.user.repository;

import com.gamegag.user.model.User;
import com.gamegag.user.model.UserConnection;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Petri Kainulainen
 */
public interface UserConnectionRepository extends JpaRepository<UserConnection, Long> {

    public UserConnection findByUserId(String userId);
}
