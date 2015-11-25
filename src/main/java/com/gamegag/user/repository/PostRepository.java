package com.gamegag.user.repository;


import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamegag.user.model.Category;
import com.gamegag.user.model.Post;

/**
 * @author Petri Kainulainen
 */
public interface PostRepository extends JpaRepository<Post, Long> {

	@Query(value="SELECT p FROM Post p WHERE p.Id > :id")
    public List<Post> findByIdInferiorAt(@Param("id") Long id,Pageable pageable);
	
	@Query(value="SELECT p FROM Post p")
	public List<Post> findWithPageable(Pageable pageable);
	
	@Query(value="SELECT p FROM Post p WHERE p.Category = :Category")
	public List<Post> findWithPageableAndCategory(@Param("Category") Category category, Pageable pageable);
	
	@Query(value="SELECT p FROM Post p WHERE p.Id > :id And p.Category = :Category")
    public List<Post> findByIdInferiorAndCategory(@Param("id") Long id,@Param("Category") Category category,Pageable pageable);
	
	
}
