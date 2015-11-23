package com.gamegag.app.repository;



import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.gamegag.app.model.Post;
import com.gamegag.app.model.Vote;

/**
 * @author Petri Kainulainen
 */
public interface VoteRepository extends JpaRepository<Vote, Long> {

}
