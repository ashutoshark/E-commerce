package in.sp.main.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.Admin;
import in.sp.main.Entities.Seller;
import in.sp.main.Services.AdminService;
import in.sp.main.Services.OrderService;
import in.sp.main.Services.ProductService;
import in.sp.main.Services.SellerService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductService productService;
	

	@GetMapping("/register")
	public String showRegisterPage() {
		return "admin/admin-register";
	}

	@PostMapping("/register")
	public String registerAdmin(@ModelAttribute Admin admin, Model model) {
		adminService.registerAdmin(admin);
		model.addAttribute("msg", "Registration successful! Please login.");
		return "admin/admin-login";
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "admin/admin-login";
	}

	@PostMapping("/login")
	public String loginAdmin(@RequestParam String username, @RequestParam String password, HttpSession session,
			Model model) {
		Admin admin = adminService.authenticate(username, password);
		if (admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:/admin/dashboard";
		} else {
			model.addAttribute("error", "Invalid username or password!");
			return "admin/admin-login";
		}
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("admin", admin);
		return "admin/admin-dashboard";
	}

	@GetMapping("/seller_list")
	public String viewAllSellers(HttpSession session, Model model) {

		Admin admin = (Admin) session.getAttribute("admin");

		if (admin == null) {
			return "redirect:/admin/login";
		}

		List<Seller> sellers = sellerService.getAllSellers();

		System.out.println("Sellers: " + sellers.size()); // DEBUG

		model.addAttribute("sellers", sellers);

		return "seller/seller-list";
	}

	@GetMapping("/orders")
	public String viewAllOrders(Model model, HttpSession session) {
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("orders", orderService.getAllOrders());
		return "admin/admin-orders";
	}

	@PostMapping("/order/updateStatus")
	public String updateOrderStatus(@RequestParam Long orderId, @RequestParam String status) {
		orderService.updateStatus(orderId, status);
		return "redirect:/admin/orders";
	}

	@GetMapping("/profile")
	public String viewProfile(HttpSession session, Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("admin", admin);
		return "admin/admin-profile";
	}

	@PostMapping("/updateProfile")
	public String updateProfile(@ModelAttribute Admin updatedAdmin, HttpSession session, Model model) {
		Admin existingAdmin = (Admin) session.getAttribute("admin");
		if (existingAdmin == null) {
			return "redirect:/admin/login";
		}

		existingAdmin.setUsername(updatedAdmin.getUsername());
		existingAdmin.setEmail(updatedAdmin.getEmail());
		existingAdmin.setPassword(updatedAdmin.getPassword());

		adminService.updateAdmin(existingAdmin);
		session.setAttribute("admin", existingAdmin);

		model.addAttribute("msg", "Profile updated successfully!");
		model.addAttribute("admin", existingAdmin);

		return "admin/admin-profile";
	}
	
	
	// these controller for admin to approve or reject products added by sellers
	@GetMapping("/products/pending")
	public String viewPendingProducts(HttpSession session, Model model) {
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("products", productService.getPendingProducts());
		return "admin/pending-products";
	}
	
	@PostMapping("/products/approve")
	public String approveProduct(@RequestParam("id") Long id) {
		productService.approveProduct(id);
		return "redirect:/admin/products/pending";
	}
	
	@PostMapping("/products/reject")
	public String rejectProduct(@RequestParam("id") Long id, @RequestParam String reason) {
		productService.rejectProduct(id, reason);
		return "redirect:/admin/products/pending";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
	}
}
