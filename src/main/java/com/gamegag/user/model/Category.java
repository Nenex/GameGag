package com.gamegag.user.model;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.gamegag.user.model.User;

@Entity
@Table(name="categories")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id_categorie")
    private Long Id;

	@Column(name = "label", nullable = false, unique = true)
	@Type(type="text")
    private String Label;
    
    @Column(name = "filename",nullable = false, unique = true)
    @Type(type="text")
    private String FileName;

    @Column(name = "disabled",nullable = true, columnDefinition = "TINYINT", length = 1)
    private Boolean disabled;
    
    @OneToMany(fetch = FetchType.EAGER)
	private Set<Post> Posts;

    
    public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getLabel() {
		return Label;
	}

	public void setLabel(String label) {
		Label = label;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}
}
