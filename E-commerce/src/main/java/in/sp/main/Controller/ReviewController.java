package in.sp.main.Controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.Product;
import in.sp.main.Entities.Review;
import in.sp.main.Entities.User;
import in.sp.main.Services.ProductService;
import in.sp.main.Services.ReviewService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ProductService productService;

    // Show Review Page
    @GetMapping("/add")
    public String showReviewPage(@RequestParam Long productId, Model model) {

        model.addAttribute("product", productService.getProductById(productId));
        model.addAttribute("review", new Review());

        return "reviews/add-review"; // JSP page
    }

    // Save Review
    @PostMapping("/save")
    public String saveReview(@ModelAttribute Review review,
                             @RequestParam Long productId,
                             HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/user/login";
        }

        review.setUser(user);

        // FETCH PROPER ENTITY
        Product product = productService.getProductById(productId);
        review.setProduct(product);

        review.setReviewDate(LocalDateTime.now());

        reviewService.saveReview(review);

        return "redirect:/shop/product/" + productId; //  redirect here to see instantly
    }     
}
 