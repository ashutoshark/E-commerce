package in.sp.main.Controller;

import in.sp.main.Entities.Product;
import in.sp.main.Entities.User;
import in.sp.main.Services.UserService;
import in.sp.main.Services.CartService;
import in.sp.main.Services.OrderService;
import in.sp.main.Services.ProductService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
 
    @GetMapping("/register")
    public String showRegisterPage() {
        return "user/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        userService.registerUser(user);
        model.addAttribute("msg", "Registration successful!");
        return "user/login";
    }


    @GetMapping("/login")
    public String showLoginPage() {
        return "user/login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {
        User user = userService.authenticate(email, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/user/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials!");
            return "user/login";
        }
    }

  
    @GetMapping("/dashboard")
    public String userDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);
        
        List<Product> products = productService.getApprovedProducts();
        model.addAttribute("products", products);
        model.addAttribute("orderCount", orderService.getOrdersByUser(user).size());
        model.addAttribute("cartCount", cartService.getCartItems(user).size());
      
        return "user/dashboard";
    }

  
    @GetMapping("/list")
    public String listAllUsers(Model model, HttpSession session) {
        Object admin = session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("users", userService.getAllUsers());
        return "user/user-list";
    }


    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model, HttpSession session) {
        Object admin = session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "user/edit-user";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("msg", "User details updated successfully!");
        return "redirect:/user/list";
    }

 
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        userService.deleteUser(id);
        redirectAttributes.addFlashAttribute("msg", "User deleted successfully!");
        return "redirect:/user/list";
    }
   
    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);
        return "user/profile";
    }
    
    @GetMapping("/profile/edit")
    public String showEditProfilePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);
        return "user/edit-profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User updatedUser, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        // Update fields
        user.setFullName(updatedUser.getFullName());
        user.setEmail(updatedUser.getEmail());
        user.setPassword(updatedUser.getPassword());
        user.setAddress(updatedUser.getAddress());
        user.setPhone(updatedUser.getPhone());

        userService.updateUser(user);
        session.setAttribute("user", user); // Refresh session data

        redirectAttributes.addFlashAttribute("msg", "Profile updated successfully!");
        return "redirect:/user/profile";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }

}
