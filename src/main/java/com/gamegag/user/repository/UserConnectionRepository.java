package com.gamegag.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamegag.user.model.UserConnection;

/**
 * @author Petri Kainulainen
 */
public interface UserConnectionRepository extends JpaRepository<UserConnection, Long> {

    public UserConnection findByUserId(String userId);
}
