package com.test.controller;

import java.util.List;
import java.util.Optional;

//import org.apache.el.stream.Optional;
import org.hibernate.query.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.model.Category;
import com.test.model.Product;
import com.test.repo.CategoryRepository;
import com.test.repo.ProductRepository;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@PostMapping
    public ResponseEntity<Category> create(@RequestBody Category category) {
		  System.out.println("Received category: " + category.getName());
        Category saved = categoryRepository.save(category);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    //Get All Category List Page Contains two category in one page
	@GetMapping
    public ResponseEntity<org.springframework.data.domain.Page<Category>> getAll(@RequestParam(defaultValue = "0") int page) {
        org.springframework.data.domain.Page<Category> categories = categoryRepository.findAll(PageRequest.of(page, 2));
        return ResponseEntity.ok(categories);
    }

	 
	// Add multiple products to a category
	  /*  @PostMapping("/{id}/products")
	    public List<Product> addProductsToCategory(@PathVariable Long id, @RequestBody List<Product> products) {
	        Optional<Category> categoryOpt = categoryRepository.findById(id);
	        if (categoryOpt.isPresent()) {
	            Category category = categoryOpt.get();
	            for (Product product : products) {
	                product.setCategory(category);
	            }
	            return productRepository.saveAll(products);
	        } else {
	            throw new RuntimeException("Category not found with id " + id);
	        }
	    }*/

	    // Fetch category by ID
	    @GetMapping("/{id}")
	    public Optional<Category> getById(@PathVariable Long id) {
	        return categoryRepository.findById(id);
	    }
        // Update Category
	    @PutMapping("/{id}")
	    public Category update(@PathVariable Long id, @RequestBody Category category) {
	        category.setId(id);
	        return categoryRepository.save(category);
	    }
        //Delete Category
	    @DeleteMapping("/{id}")
	    public void delete(@PathVariable Long id) {
	        categoryRepository.deleteById(id);
	    }

}
