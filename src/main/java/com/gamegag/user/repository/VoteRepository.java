package com.gamegag.user.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamegag.user.model.Post;
import com.gamegag.user.model.User;
import com.gamegag.user.model.Vote;

/**
 * @author Petri Kainulainen
 */
public interface VoteRepository extends JpaRepository<Vote, Long> {
	
	@Query("SELECT v FROM Vote v WHERE v.Post = :Post")
    public List<Vote> findAllByIdPost(@Param("Post") Post post);
	
	@Query("SELECT COUNT(*) FROM Vote v WHERE v.Post = :Post AND v.Vote = 1")
    public Integer getVotePlusBy(@Param("Post") Post post);
	
	@Query("SELECT COUNT(*) FROM Vote v WHERE v.Post = :Post AND v.Vote = 0")
    public Integer getVoteMoinsBy(@Param("Post") Post post);
	
	@Query("SELECT v FROM Vote v WHERE v.Post = :Post AND v.User = :User")
    public Vote findOneByPostAndUser(@Param("Post") Post post,@Param("User") User user);
}
