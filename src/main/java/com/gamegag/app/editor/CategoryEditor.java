package com.gamegag.app.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.gamegag.app.model.Category;
import com.gamegag.app.repository.CategoryRepository;
import com.gamegag.app.repository.PostRepository;

public class CategoryEditor extends PropertyEditorSupport{
	
	@Autowired CategoryRepository repo;

    //This will be called when user HTTP Post to server a field bound to DepartmentVO
    @Override
    public void setAsText(String id)
    {
        this.setValue(repo.findOne(Long.parseLong(id)));
    }
}

