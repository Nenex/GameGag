package com.gamegag.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamegag.user.model.Category;

/**
 * @author Petri Kainulainen
 */
public interface CategoryRepository extends JpaRepository<Category, Long> {


}
