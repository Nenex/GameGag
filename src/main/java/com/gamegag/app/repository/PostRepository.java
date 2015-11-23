package com.gamegag.app.repository;


import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamegag.app.model.Post;

/**
 * @author Petri Kainulainen
 */
public interface PostRepository extends JpaRepository<Post, Long> {

	@Query("SELECT p FROM Post p WHERE p.Id > :id")
    public List<Post> findByIdInferiorAt(@Param("id") Long id,Pageable pageable);
	
	@Query(value="SELECT p FROM Post p")
	public List<Post> findWithPageable(Pageable pageable);
	
}
