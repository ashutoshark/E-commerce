package in.sp.main.Services;

import in.sp.main.Entities.CartItem;
import in.sp.main.Entities.Product;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.CartRepository;
import in.sp.main.Repositories.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepo;

    @Autowired
    private ProductRepository productRepo;

    public void addProductToCart(Long userId, Long productId, int quantity) {
        Product product = productRepo.findById(productId).orElse(null);
        if (product == null) return;

        // Check if product already exists in cart
        CartItem existingItem = cartRepo.findByUserIdAndProductId(userId, productId);

        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
            cartRepo.save(existingItem);
        } else {
            CartItem newItem = new CartItem();
            User user = new User();
            user.setId(userId);
            newItem.setUser(user);
            newItem.setProduct(product);
            newItem.setQuantity(quantity);
            cartRepo.save(newItem);
        }
    }

    public List<CartItem> getCartItems(User user) {
        return cartRepo.findByUser(user);
    }

    public void removeItem(Long cartItemId) {
        cartRepo.deleteById(cartItemId);
    }

    public void updateQuantity(Long cartItemId, int quantity) {
        CartItem item = cartRepo.findById(cartItemId).orElse(null);
        if (item != null) {
            item.setQuantity(quantity);
            cartRepo.save(item);
        }
    }

    public double calculateTotal(User user) {
        List<CartItem> items = getCartItems(user);
        return items.stream()
                .mapToDouble(i -> i.getProduct().getPrice().doubleValue() * i.getQuantity())
                .sum();
    }
}
