package com.test.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.test.model.Category;
import com.test.repo.CategoryRepository;
import com.test.repo.ProductRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductRepository productRepository;

	public Category save(Category category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(category);
	}

	public Page<Category> findAll(PageRequest of) {
		// TODO Auto-generated method stub
		return categoryRepository.findAll(of);
	}

	public Optional<Category> findById(Long id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		categoryRepository.deleteById(id);
	}

}
