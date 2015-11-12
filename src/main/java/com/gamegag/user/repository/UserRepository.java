package com.gamegag.user.repository;

import com.gamegag.user.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Petri Kainulainen
 */
public interface UserRepository extends JpaRepository<User, Long> {

    public User findByEmail(String email);
}
