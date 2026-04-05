package in.sp.main.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import in.sp.main.Entities.User;
import in.sp.main.Entities.Wishlist;
import in.sp.main.Repositories.WishlistRepository;
import in.sp.main.Services.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {

	@Autowired
	private WishlistRepository wishlistRepository;

	@Autowired
	private ProductService productService;

	// ADD TO WISHLIST
	@GetMapping("/add/{productId}")
	public String addToWishlist(@PathVariable Long productId, HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/user/login";
		}

		// avoid duplicate
		Wishlist existing = wishlistRepository.findByUserIdAndProductId(user.getId(), productId);

		if (existing == null) {
			Wishlist wishlist = new Wishlist();
			wishlist.setUser(user);
			wishlist.setProduct(productService.getProductById(productId));

			wishlistRepository.save(wishlist);
		}

		return "redirect:/shop/products";
	}

	@GetMapping("/toggle/{productId}")
	public String toggleWishlist(@PathVariable Long productId, HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/user/login";
		}

		Wishlist existing = wishlistRepository.findByUserIdAndProductId(user.getId(), productId);

		if (existing != null) {
			wishlistRepository.delete(existing);
		} else {
			Wishlist w = new Wishlist();
			w.setUser(user);
			w.setProduct(productService.getProductById(productId));
			wishlistRepository.save(w);
		}

		return "redirect:/shop/products";
	}

	// VIEW WISHLIST
	@GetMapping
	public String viewWishlist(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		List<Wishlist> list = wishlistRepository.findByUserId(user.getId());

		model.addAttribute("wishlist", list);

		return "user/wishlist";
	}

	// REMOVE
	@GetMapping("/remove/{productId}")
	@Transactional
	public String remove(@PathVariable Long productId, HttpSession session) {

		User user = (User) session.getAttribute("user");

		wishlistRepository.deleteByUserIdAndProductId(user.getId(), productId);

		return "redirect:/wishlist";
	}
}
