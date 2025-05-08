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
import com.test.service.CategoryService;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	//Save Category
	@PostMapping
    public ResponseEntity<Category> create(@RequestBody Category category) {
		  System.out.println("Received category: " + category.getName());
        Category saved = categoryService.save(category);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    //Get All Category List, Page Contains two category in one page
	@GetMapping
    public ResponseEntity<org.springframework.data.domain.Page<Category>> getAll(@RequestParam(defaultValue = "0") int page) {
        org.springframework.data.domain.Page<Category> categories = categoryService.findAll(PageRequest.of(page, 2));
        return ResponseEntity.ok(categories);
    }


	    // Fetch category by ID
	    @GetMapping("/{id}")
	    public Optional<Category> getById(@PathVariable Long id) {
	        return categoryService.findById(id);
	    }
        // Update Category
	    @PutMapping("/{id}")
	    public Category update(@PathVariable Long id, @RequestBody Category category) {
	        category.setId(id);
	        return categoryService.save(category);
	    }
        //Delete Category
	    @DeleteMapping("/{id}")
	    public void delete(@PathVariable Long id) {
	    	categoryService.deleteById(id);
	    }

}
