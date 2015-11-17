package com.gamegag.app.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import com.gamegag.user.model.User;

@Entity
@Table(name="comments")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id_comment")
    private Long Id;

    @Column(name="id_answer")
    private Long IdAnswer;
	
    @ManyToOne  
	@JoinColumn(name = "id_post")  
	private Post Post;
	
	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id_utilisateur")
	private User User;

	@Column(name = "creation_time", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    private DateTime CreationTime;
	
	@Column(name = "COMMENT",columnDefinition="char")
	private String Comment;
	
	@Column(name = "disabled",nullable = true, columnDefinition = "TINYINT", length = 1)
	private Boolean disabled;
	
	
	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public Long getIdAnswer() {
		return IdAnswer;
	}

	public void setIdAnswer(Long idAnswer) {
		IdAnswer = idAnswer;
	}

	public Post getPost() {
		return Post;
	}

	public void setPost(Post post) {
		Post = post;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User user) {
		User = user;
	}

	public DateTime getCreationTime() {
		return CreationTime;
	}

	public void setCreationTime(DateTime creationTime) {
		CreationTime = creationTime;
	}

	public String getComment() {
		return Comment;
	}

	public void setComment(String comment) {
		Comment = comment;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}
   
}
