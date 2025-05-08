package com.test.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.test.model.Category;
import com.test.model.Product;
import com.test.repo.CategoryRepository;
import com.test.repo.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;

	public Product save(Product product) {
		// TODO Auto-generated method stub
		return productRepository.save(product);
	}

	public Page<Product> findAll(PageRequest of) {
		// TODO Auto-generated method stub
		return productRepository.findAll(of);
	}

	public Optional<Product> findById(Long id) {
		// TODO Auto-generated method stub
		return productRepository.findById(id);
	}

	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		productRepository.deleteById(id);
	}

}
