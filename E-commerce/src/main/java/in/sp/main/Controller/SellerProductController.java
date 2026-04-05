package in.sp.main.Controller;

 

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

import in.sp.main.Entities.*;
import in.sp.main.Enums.CategoryType;
import in.sp.main.Repositories.CategoryRepository;
import in.sp.main.Services.*;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/seller/products")
public class SellerProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private FileUploadService fileUploadService;

    //Show only seller products
    @GetMapping
    public String sellerProducts(HttpSession session, Model model) {

        Seller seller = (Seller) session.getAttribute("seller");

        if (seller == null) {
            return "redirect:/seller/login";
        }

        model.addAttribute("products",
                productService.getProductsBySeller(seller.getId()));

        return "seller/seller-product-list";
    }

    //  Add products form
    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categoryTypes", CategoryType.values());
        return "seller/seller-product-form";
    }

    // Save products
    @PostMapping("/save")
    public String saveProduct(@ModelAttribute Product product,
                             @RequestParam MultipartFile imageFile,
                             HttpSession session) {

        try {
            Seller seller = (Seller) session.getAttribute("seller");

            product.setSeller(seller);
            product.setApproved(false);
            product.setRejectionReason(null);

            if (product.getCategoryType() != null) {
                Category category = categoryRepository.findByName(
                        product.getCategoryType().name());
                product.setCategory(category);
            }

            if (!imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveFile(imageFile);
                product.setImageUrl(imageUrl);
            }

            productService.saveProduct(product);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/seller/products";
    }

    // Edit saved products 
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       HttpSession session,
                       Model model) {

        Seller seller = (Seller) session.getAttribute("seller");
        Product product = productService.getProductById(id);

        if (!product.getSeller().getId().equals(seller.getId())) {
            return "redirect:/seller/products";
        }

        model.addAttribute("product", product);
        model.addAttribute("categoryTypes", CategoryType.values());

        return "seller/seller-product-form";
    }

    // Update and save edited products
    @PostMapping("/update")
    public String update(@ModelAttribute Product product,
                         @RequestParam MultipartFile imageFile,
                         HttpSession session) {

        Seller seller = (Seller) session.getAttribute("seller");
        Product existing = productService.getProductById(product.getId());

        if (!existing.getSeller().getId().equals(seller.getId())) {
            return "redirect:/seller/products";
        }

        product.setSeller(seller);
        product.setApproved(false);
        product.setRejectionReason(null);

        if (product.getCategoryType() != null) {
            Category category = categoryRepository.findByName(
                    product.getCategoryType().name());
            product.setCategory(category);
        }

        try {
            if (!imageFile.isEmpty()) {
                String imageUrl = fileUploadService.saveFile(imageFile);
                product.setImageUrl(imageUrl);
            } else {
                product.setImageUrl(existing.getImageUrl());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        productService.updateProduct(product);

        return "redirect:/seller/products";
    }

    // Delete
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         HttpSession session) {

        Seller seller = (Seller) session.getAttribute("seller");
        Product product = productService.getProductById(id);

        if (!product.getSeller().getId().equals(seller.getId())) {
            return "redirect:/seller/products";
        }

        productService.deleteProduct(id);

        return "redirect:/seller/products";
    }
}
