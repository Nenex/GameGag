package com.gamegag.app.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.gamegag.user.model.User;

@Entity
@Table(name="votes")
public class Vote {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id_vote")
    private Long Id;
    
	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id_utilisateur")
	private User User;

	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id_post")
	private Post Post;
	
    @Column(name = "vote",nullable = true, columnDefinition = "TINYINT", length = 1)
    private Boolean Vote;

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User user) {
		User = user;
	}

	public Post getPost() {
		return Post;
	}

	public void setPost(Post post) {
		Post = post;
	}

	public Boolean getVote() {
		return Vote;
	}

	public void setVote(Boolean vote) {
		Vote = vote;
	}
    
}