package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.sp.main.Entities.Order;
import in.sp.main.Entities.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
    @Query("SELECT DISTINCT o FROM Order o JOIN o.items oi WHERE oi.product.seller.id = :sellerId")
    List<Order> findOrdersBySeller(@Param("sellerId") Long sellerId);
}
