package com.gamegag.user.model;

import com.gamegag.user.model.Post;
import com.gamegag.common.model.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.FetchMode;
import org.hibernate.annotations.Fetch;

import java.util.List;
import java.util.Set;

import javax.persistence.*;

/**
 * @author Petri Kainulainen
 */
@Entity
@Table(name = "user_accounts")
public class User extends BaseEntity<Long> {

    public Set<Post> getPosts() {
		return Posts;
	}

	public void setPosts(Set<Post> posts) {
		Posts = posts;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setSignInProvider(SocialMediaService signInProvider) {
		this.signInProvider = signInProvider;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "first_name", length = 100,nullable = false)
    private String firstName;

    @Column(name = "last_name", length = 100, nullable = false)
    private String lastName;

    @Column(name = "password", length = 255)
    private String password;
    
    @Column(name = "filename", length = 255, nullable = true)
    private String filename;
    
    public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Enumerated(EnumType.STRING)
    @Column(name = "role", length = 20, nullable = false)
    private Role role;

    @Enumerated(EnumType.STRING)
    @Column(name = "sign_in_provider", length = 20)
    private SocialMediaService signInProvider;

    @OneToMany(fetch = FetchType.EAGER)
	private Set<Post> Posts;
    
    public User() {

    }

    public static Builder getBuilder() {
        return new Builder();
    }

    @Override
    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    public String getfilename() {
        return filename;
    }

    public String getPassword() {
        return password;
    }

    public Role getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = Role.valueOf(role);
    }

    public SocialMediaService getSignInProvider() {
        return signInProvider;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("id", id)
                .append("creationTime", this.getCreationTime())
                .append("email", email)
                .append("firstName", firstName)
                .append("lastName", lastName)
                .append("modificationTime", this.getModificationTime())
                .append("signInProvider", this.getSignInProvider())
                .append("version", this.getVersion())
                .append("filename", this.getfilename())
                .toString();
    }

    public static class Builder {

        private User user;

        public Builder() {
            user = new User();
            user.role = Role.ROLE_USER;
        }

        public Builder email(String email) {
            user.email = email;
            return this;
        }

        public Builder firstName(String firstName) {
            user.firstName = firstName;
            return this;
        }

        public Builder lastName(String lastName) {
            user.lastName = lastName;
            return this;
        }
        
        public Builder filename(String filename) {
            user.filename = filename;
            return this;
        }

        public Builder password(String password) {
            user.password = password;
            return this;
        }

        public Builder signInProvider(SocialMediaService signInProvider) {
            user.signInProvider = signInProvider;
            return this;
        }

        public User build() {
            return user;
        }
    }
}
