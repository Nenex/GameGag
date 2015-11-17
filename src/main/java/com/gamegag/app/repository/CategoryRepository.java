package com.gamegag.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamegag.app.model.Category;

/**
 * @author Petri Kainulainen
 */
public interface CategoryRepository extends JpaRepository<Category, Long> {


}
