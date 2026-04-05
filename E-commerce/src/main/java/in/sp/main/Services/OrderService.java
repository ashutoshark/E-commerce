package in.sp.main.Services;

import in.sp.main.Entities.CartItem;
import in.sp.main.Entities.Order;
import in.sp.main.Entities.OrderItem;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.CartItemRepository;
import in.sp.main.Repositories.OrderItemRepository;
import in.sp.main.Repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;  // ✅ Important for DB transactions

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderService {

    @Autowired 
    private OrderRepository orderRepository;

    @Autowired 
    private CartItemRepository cartItemRepository;

    @Autowired 
    private OrderItemRepository orderItemRepository;

    /**
     * ✅ Places an order for the user by converting cart items into an order.
     * Transactional ensures all DB operations happen atomically.
     */
    @Transactional
    public Order createOrderForUser(User user) {
        List<CartItem> cartItems = cartItemRepository.findByUser(user);
        if (cartItems == null || cartItems.isEmpty()) {
            throw new RuntimeException("Cart is empty! Cannot place order.");
        }

      
        double total = cartItems.stream()
                .mapToDouble(ci -> ci.getProduct().getPrice().doubleValue() * ci.getQuantity())
                .sum();

       
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("PENDING");
        order.setPaymentStatus("UNPAID");
        order.setTotalAmount(total);
        Order savedOrder = orderRepository.save(order);

 
        for (CartItem ci : cartItems) {
            OrderItem oi = new OrderItem();
            oi.setOrder(savedOrder);
            oi.setProduct(ci.getProduct());
            oi.setQuantity(ci.getQuantity());
            oi.setPrice(ci.getProduct().getPrice());
            orderItemRepository.save(oi);
        }

       
        cartItemRepository.deleteByUser(user);

        return savedOrder;
    }

   
    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    
    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

  
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public List<Order> getOrdersBySeller(Long sellerId) {
        return orderRepository.findOrdersBySeller(sellerId);
    }
    
    @Transactional
    public void updateStatus(Long orderId, String status) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order != null) {
            order.setStatus(status);
            orderRepository.save(order);
        }
    }
}
