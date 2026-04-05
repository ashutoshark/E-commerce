package in.sp.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.Seller;
import in.sp.main.Services.AdminService;
import in.sp.main.Services.OrderService;
import in.sp.main.Services.ProductService;
import in.sp.main.Services.SellerService;
import jakarta.servlet.http.HttpSession;

//@Controller
//@RequestMapping("/seller")
//public class SelllerController {
//	
//	@Autowired
//	private SellerService sellerService;
//	
//	@Autowired
//	private ProductService productService;
//	
//	@GetMapping("/register")
//		public String showRegisterPage() {
//		return "seller/seller-register";
//	}
//	
//	@PostMapping("/register")
//	public String registerSeller(@ModelAttribute Seller seller, Model model) {
//		sellerService.registerSeller(seller);
//		model.addAttribute("msg", "Registration successful! Please login.");
//		return "seller/seller-login";
//	}
//	
//	@GetMapping("/login")
//	public String showLoginPage() {
//		return "seller/seller-login";
//	}
//	
//	@PostMapping("/login")
//	public String loginSeller(@RequestParam String email,
//							  @RequestParam String password,
//							  HttpSession session,
//							  Model model) {
//		Seller seller = sellerService.authenticate(email, password);
//		if (seller != null) {
//			session.setAttribute("seller", seller);
//			return "redirect:/seller/dashboard";
//		} else {
//			model.addAttribute("error", "Invalid email or password!");
//			return "seller/seller-login";
//		}
//	}
//	
//	@GetMapping("/dashboard")
//	public String showDashboard(HttpSession session, Model model) {
//		Seller seller = (Seller) session.getAttribute("seller");
//		if (seller == null) {
//			return "redirect:/seller/login";
//		}
//		model.addAttribute("products", productService.getProductsBySeller(seller.getId()));
//		return "seller/seller-dashboard";
//	}
//	
//}

 
@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private OrderService orderService;
	
	
	@GetMapping("/register")
	public String showRegisterPage() {
		return "seller/seller-register";
	}
	
	@PostMapping("/register")
	public String registerSeller(@ModelAttribute Seller seller, Model model) {
		sellerService.registerSeller(seller);
		model.addAttribute("msg", "Registration successful! Please login.");
		return "seller/seller-login";
	}
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "seller/seller-login";
	}
	
	@PostMapping("/login")
	public String loginSeller(@RequestParam String email,
							  @RequestParam String password,
							  HttpSession session,
							  Model model) {

		Seller seller = sellerService.authenticate(email, password);

		if (seller != null) {
			session.setAttribute("seller", seller);
			return "redirect:/seller/dashboard";
		} else {
			model.addAttribute("error", "Invalid email or password!");
			return "seller/seller-login";
		}
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		Seller seller = (Seller) session.getAttribute("seller");

		if (seller == null) {
			return "redirect:/seller/login";
		}

		model.addAttribute("seller", seller);
		model.addAttribute("totalProducts",
				productService.getProductsBySeller(seller.getId()).size());

		return "seller/seller-dashboard";
	}
	@GetMapping("/edit/{id}")
	public String editProfile(@PathVariable Long id, HttpSession session, Model model) {
		 Object admin = session.getAttribute("admin");
		 	        if (admin == null) {
	            return "redirect:/admin/login";
	        }
	        
	        Seller seller = sellerService.getSellerById(id);
	        model.addAttribute("seller", seller);
	        return "seller/seller-edit-profile";
	}
	
	@PostMapping("/update")
	public String updateProfile(@ModelAttribute Seller seller, HttpSession session) {
		 Object admin = session.getAttribute("admin");
		 	        if (admin == null) {
	            return "redirect:/admin/login";
	        }
	        
	        sellerService.updateSeller(seller);
	        return "redirect:/admin/seller_list";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteSeller(@PathVariable Long id, HttpSession session) {
		Seller seller = (Seller) session.getAttribute("seller");
		 	        if (seller == null) {
	            return "redirect:/admin/login";
	        }
	        
	        sellerService.deleteSeller(id);
	        return "redirect:/admin/seller_list";

	}
	
	// These methods for sellers to track and manage their products which is ordered by customers.
//	They can view orders, update order status, and manage their inventory.
	
	@GetMapping("/orders")
	public String viewSellerOrders(HttpSession session, Model model) {
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			return "redirect:/seller/login";
		}
		model.addAttribute("orders", orderService.getOrdersBySeller(seller.getId()));
		return "seller/seller-orders";
	}
	
	@PostMapping("/orders/updateStatus")
	public String updateSellerOrderStatus(@RequestParam Long orderId, @RequestParam String status, HttpSession session) {
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			return "redirect:/seller/login";
		}
		orderService.updateStatus(orderId, status);
		return "redirect:/seller/orders";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/seller/login";
	}
}