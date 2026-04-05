package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import in.sp.main.Entities.Product;
import in.sp.main.Entities.Review;
import in.sp.main.Entities.User;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByProduct(Product product);
    List<Review> findByUser(User user);
    List<Review> findByProductId(Long productId);
    
 // ✅ Average Rating
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId")
    Double findAverageRatingByProductId(Long productId);

    // ✅ Latest 5 Reviews
    List<Review> findTop5ByProductIdOrderByReviewDateDesc(Long productId);
}
