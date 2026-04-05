package in.sp.main.Controller;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.Entities.User;
import in.sp.main.Services.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/place")
    public String placeOrder(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        orderService.createOrderForUser(user);
        model.addAttribute("msg", "Order placed successfully!");
        return "orders/order-confirmation";
    }

    @GetMapping("/my-orders")
    public String viewUserOrders(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("orders", orderService.getOrdersByUser(user));
        return "orders/my-orders";
    }
}
