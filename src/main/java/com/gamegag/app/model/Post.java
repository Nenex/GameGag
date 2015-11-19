package com.gamegag.app.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import com.gamegag.user.model.User;

@Entity
@Table(name="user_posts")
public class Post {
    
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id_post", nullable = false)
	private Long Id;

	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id_categorie")
	private Category Category;

	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id_utilisateur")
	private User User;

	@Column(name = "creation_time", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    private DateTime CreationTime;
	
	@Column(name = "title",columnDefinition="char")
	private String Title;

	@Column(name = "description",columnDefinition="char")
	private String Description;
	
	@Column(name = "filename",columnDefinition="char")
	private String Filename;

	@Column(name = "validation",columnDefinition = "TINYINT", length = 1)
	private Boolean Validation;
	
	@OneToMany(mappedBy="Post",cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Comment> Comments;
		  
	public List<Comment> getComments() {
		return Comments;
	}

	public void setComments(List<Comment> comments) {
		Comments = comments;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long Id) {
		this.Id = Id;
	}
	
	public Category getCategory() {
		return Category;
	}

	public void setCategory(Category category) {
		Category = category;
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

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getFilename() {
		return Filename;
	}

	public void setFilename(String filename) {
		Filename = filename;
	}

	public Boolean getValidation() {
		return Validation;
	}

	public void setValidation(Boolean validation) {
		Validation = validation;
	}
	
}
