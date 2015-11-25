package com.gamegag.user.repository;



import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamegag.user.model.Comment;
import com.gamegag.user.model.Post;
import com.gamegag.user.model.Vote;

/**
 * @author Petri Kainulainen
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
	
	@Query("SELECT c FROM Comment c WHERE c.Post = :Post")
    public List<Comment> findAllByIdPost(@Param("Post") Post post);
	
}
