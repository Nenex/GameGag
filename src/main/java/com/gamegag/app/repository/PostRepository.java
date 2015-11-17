package com.gamegag.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamegag.app.model.Post;

/**
 * @author Petri Kainulainen
 */
public interface PostRepository extends JpaRepository<Post, Long> {


}
