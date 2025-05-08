package com.test.controller;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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
import com.test.service.CategoryService;
import com.test.service.ProductService;

@RestController
@RequestMapping("/api/products")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	 // Create a product and add it to its category
    @PostMapping
    public Product createProductWithCategory(@RequestBody Product product) {
        if (product.getCategory() == null || product.getCategory().getId() == null) {
            throw new RuntimeException("Category ID must be provided in the product request");
        }

        Optional<Category> categoryOpt = categoryService.findById(product.getCategory().getId());
        if (categoryOpt.isEmpty()) {
            throw new RuntimeException("Category not found with id " + product.getCategory().getId());
        }

        product.setCategory(categoryOpt.get());
        return productService.save(product);
    }

	//Get all products
	@GetMapping
    public Page<Product> getAll(@RequestParam(defaultValue = "0") int page) {
        return productService.findAll(PageRequest.of(page, 2));
    }

	// GET product by Id 
	@GetMapping("/{id}")
    public Product getById(@PathVariable Long id) {
        return productService.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found with id " + id));
    }

	// update product by id
    @PutMapping("/{id}")
    public Product update(@PathVariable Long id, @RequestBody Product product) {
        product.setId(id);
        return productService.save(product);
    }

    //Delete product by id
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        productService.deleteById(id);
    }

	
	
}
