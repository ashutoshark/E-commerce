package in.sp.main.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.Product;
import in.sp.main.Entities.User;
import in.sp.main.Entities.Wishlist;
import in.sp.main.Repositories.WishlistRepository;
import in.sp.main.Services.CartService;
import in.sp.main.Services.OrderService;
import in.sp.main.Services.ProductService;
import in.sp.main.Services.ReviewService;
import in.sp.main.Services.SellerService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CartService cartService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private WishlistRepository wishlistRepository;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ReviewService reviewService;

	@GetMapping("/products")
	public String showProducts(@RequestParam(required = false) String keyword,
	                          HttpSession session,
	                          Model model) {

	    List<Product> products;

	    if (keyword != null && !keyword.isEmpty()) {
	        products = productService.searchApprovedProducts(keyword);
	        model.addAttribute("keyword", keyword);
	    } else {
	        products = productService.getApprovedProducts();
	    }

	    model.addAttribute("products", products);

	    // Average rating logic
	    Map<Long, Double> ratingMap = new HashMap<>();

	    for (Product p : products) {
	        ratingMap.put(p.getId(), reviewService.getAverageRating(p.getId()));
	    }

	    model.addAttribute("ratingMap", ratingMap);

	    // Wishlist logic - get wishlist product IDs for logged in user
	    User user = (User) session.getAttribute("user");

	    if (user != null) {
	        List<Wishlist> wishlist = wishlistRepository.findByUserId(user.getId());

	        List<Long> wishlistIds = wishlist.stream()
	                .map(w -> w.getProduct().getId())
	                .toList();

	        model.addAttribute("wishlistIds", wishlistIds);
	    }

	    return "shop/shop-product-list";
	}
	@GetMapping("/product/{id}")
	public String viewProduct(@PathVariable Long id, Model model) {
	    model.addAttribute("product", productService.getProductById(id));
	    model.addAttribute("reviews", reviewService.getLatestReviews(id));
	    model.addAttribute("avgRating", reviewService.getAverageRating(id));
	    return "shop/shop-product-details";
	}

	@PostMapping("/add-to-cart")
	public String addToCart(@RequestParam Long productId, @RequestParam(defaultValue = "1") int quantity,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/login";
		}
		cartService.addProductToCart(user.getId(), productId, quantity);
		return "redirect:/shop/cart";
	}

	@GetMapping("/cart")
	public String viewCart(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("cartItems", cartService.getCartItems(user));
		model.addAttribute("total", cartService.calculateTotal(user));
		return "shop/cart";
	}

	@GetMapping("/cart/remove/{id}")
	public String removeFromCart(@PathVariable Long id) {
		cartService.removeItem(id);
		return "redirect:/shop/cart";
	}

	@PostMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/login";
		}

		orderService.createOrderForUser(user);
		model.addAttribute("msg", "Order placed successfully!");
		return "shop/order-confirmation";
	}

	@GetMapping("/my-orders")
	public String myOrders(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("orders", orderService.getOrdersByUser(user));
		return "shop/my-orders";
	}
}
