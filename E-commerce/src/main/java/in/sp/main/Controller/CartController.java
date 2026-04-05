package in.sp.main.Controller;

import in.sp.main.Entities.User;
import in.sp.main.Services.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;


    @PostMapping("/add")
    public String addToCart(@RequestParam Long productId,
                            @RequestParam(defaultValue = "1") int quantity,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        cartService.addProductToCart(user.getId(), productId, quantity);
        return "redirect:/cart/view";
    }

    
    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("cartItems", cartService.getCartItems(user));
        model.addAttribute("totalPrice", cartService.calculateTotal(user));
        return "cart/cart";
    }

   
    @GetMapping("/remove/{id}")
    public String removeFromCart(@PathVariable Long id) {
        cartService.removeItem(id);
        return "redirect:/cart/view";
    }

  
    @PostMapping("/updateQuantity")
    public String updateQuantity(@RequestParam Long cartItemId,
                                 @RequestParam int quantity) {
        cartService.updateQuantity(cartItemId, quantity);
        return "redirect:/cart/view";
    }
}
