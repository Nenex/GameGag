package com.gamegag.user.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "userconnection")
public class UserConnection implements Serializable {
	
	@Id
	@Column(name = "userId", length = 255, nullable = false, unique = true)
    private String userId;
	
	@Id
	@Column(name = "providerId", length = 255, nullable = false, unique = true)
    private String providerId;
	
	@Id
	@Column(name = "providerUserId", length = 255, nullable = false, unique = true)
    private String providerUserId = "";
	
	@Column(name = "rank", length = 11, nullable = false)
    private int rank;
	
	@Column(name = "displayName", length = 255)
    private String displayName;
	
	@Column(name = "profileUrl", length = 512)
    private String profileUrl;
	
	@Column(name = "imageUrl", length = 512)
    private String imageUrl;
	
	@Column(name = "accessToken", length = 255,nullable = false)
    private String accessToken;
	
	@Column(name = "secret", length = 255)
    private String secret;
	
	@Column(name = "refreshToken", length = 255)
    private String refreshToken;
	
	@Column(name = "expireTime", length = 255)
    private Long expireTime;
	
	 public UserConnection() {

	    }
    public UserConnection(String userId, String providerId, String providerUserId, int rank, String displayName, String profileUrl, String imageUrl, String accessToken, String secret, String refreshToken, Long expireTime) {
        this.userId = userId;
        this.providerId = providerId;
        this.providerUserId = providerUserId;
        this.rank = rank;
        this.displayName = displayName;
        this.profileUrl = profileUrl;
        this.imageUrl = imageUrl;
        this.accessToken = accessToken;
        this.secret = secret;
        this.refreshToken = refreshToken;
        this.expireTime = expireTime;
    }

    public String toString() {
        return
            "userId = " + userId +
            ", providerId = " + providerId +
            ", providerUserId = " + providerUserId +
            ", rank = " + rank +
            ", displayName = " + displayName +
            ", profileUrl = " + profileUrl +
            ", imageUrl = " + imageUrl +
            ", accessToken = " + accessToken +
            ", secret = " + secret +
            ", refreshToken = " + refreshToken +
            ", expireTime = " + expireTime;
    }

    public String getUserId() {
        return userId;
    }

    public String getProviderId() {
        return providerId;
    }

    public String getProviderUserId() {
        return providerUserId;
    }

    public int getRank() {
        return rank;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getProfileUrl() {
        return profileUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public String getSecret() {
        return secret;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public Long getExpireTime() {
        return expireTime;
    }
}
