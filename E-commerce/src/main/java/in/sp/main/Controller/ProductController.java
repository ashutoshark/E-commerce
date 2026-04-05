	package in.sp.main.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.Entities.Category;
import in.sp.main.Entities.Product;
import in.sp.main.Enums.CategoryType;
import in.sp.main.Repositories.CategoryRepository;
import in.sp.main.Services.FileUploadService;
import in.sp.main.Services.ProductService;
import in.sp.main.Services.ReviewService;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private FileUploadService fileUploadService;
    
    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private ReviewService reviewService;

    
    @GetMapping
    public String showProducts(@RequestParam(required = false) String keyword, Model model) {
        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("products", productService.searchApprovedProducts(keyword));
            model.addAttribute("keyword", keyword);
        } else {
            model.addAttribute("products", productService.getApprovedProducts());
        }
        return "product/product-list";
    }

  
    @GetMapping("/{id}")
    public String viewProduct(@PathVariable Long id, Model model) {

        Product product = productService.getProductById(id);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviewService.getLatestReviews(id));
        model.addAttribute("avgRating", reviewService.getAverageRating(id));

        return "product/product-details";
    }

  
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categoryTypes", CategoryType.values());
        return "product/product-form";
    }


    @PostMapping("/save")
    public String saveProduct(@ModelAttribute Product product,
                              @RequestParam("imageFile") MultipartFile imageFile,
                              RedirectAttributes redirectAttributes) {
        try {
        	if (product.getCategoryType() != null) {
                Category category = categoryRepository.findByName(
                        product.getCategoryType().name()
                );
                product.setCategory(category);
            }
        	
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveFile(imageFile);
                product.setImageUrl(imageUrl);
            }
            productService.saveProduct(product);
            redirectAttributes.addFlashAttribute("success", "Product added successfully!");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Image upload failed: " + e.getMessage());
        }
        return "redirect:/products";
    }

   
    @GetMapping("/edit/{id}")
    public String editProduct(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("categoryTypes", CategoryType.values());
        return "product/product-form";
    }


    @PostMapping("/update")
    public String updateProduct(@ModelAttribute Product product,
                                @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                RedirectAttributes redirectAttributes) {
        try {
        	
        	if (product.getCategoryType() != null) {
                Category category = categoryRepository.findByName(
                        product.getCategoryType().name()
                );
                product.setCategory(category);
            }
        	
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveFile(imageFile);
                product.setImageUrl(imageUrl);
            }
            productService.updateProduct(product);
            redirectAttributes.addFlashAttribute("success", "Product updated successfully!");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Image update failed: " + e.getMessage());
        }
        return "redirect:/products";
    }

  
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        productService.deleteProduct(id);
        redirectAttributes.addFlashAttribute("success", "Product deleted successfully!");
        return "redirect:/products";
    }
}
