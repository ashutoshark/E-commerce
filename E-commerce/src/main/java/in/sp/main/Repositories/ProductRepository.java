package in.sp.main.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.Entities.Category;
import in.sp.main.Entities.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
	 List<Product> findByNameContainingIgnoreCase(String name);

	 List<Product> findBySellerId(Long sellerId);

	 List<Product> findByNameContainingIgnoreCaseAndSellerId(String name, Long sellerId);
	 
	 List<Product> findByApproved(boolean approved);
	 
	 List<Product> findByNameContainingIgnoreCaseAndApproved(String keyword, boolean approved);
}
