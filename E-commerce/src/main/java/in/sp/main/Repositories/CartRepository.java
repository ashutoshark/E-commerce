package in.sp.main.Repositories;

import in.sp.main.Entities.CartItem;
import in.sp.main.Entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CartRepository extends JpaRepository<CartItem, Long> {
    List<CartItem> findByUser(User user);

    @Query("SELECT c FROM CartItem c WHERE c.user.id = :userId AND c.product.id = :productId")
    CartItem findByUserIdAndProductId(Long userId, Long productId);
}
