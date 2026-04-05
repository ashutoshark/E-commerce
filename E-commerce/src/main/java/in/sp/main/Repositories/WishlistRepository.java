package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Wishlist;

public interface WishlistRepository extends JpaRepository<Wishlist, Long> {

	List<Wishlist> findByUserId(Long userId);
	
	Wishlist findByUserIdAndProductId(Long userId, Long productId);
	
	void deleteByUserIdAndProductId(Long userId, Long productId);
}
