package com.gamegag.user.model;


import org.hibernate.annotations.Type;
import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

@Entity
@Table(name = "test")
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "test", length = 100, nullable = false, unique = true)
	private String test;

	public Test() {

	}

	public static Builder getBuilder() {
		return new Builder();
	}

    public Long getId() {
        return id;
    }
	
	public String getTest() {
		return test;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this).append("id", id).append("test", test).toString();
	}

	public static class Builder {

		private Test testbase;
		public Builder() {
			testbase = new Test();
        }
		public Builder test(String test) {
			testbase.test = test;
			return this;
		}

		public Test build() {
			return testbase;
		}
	}
}
