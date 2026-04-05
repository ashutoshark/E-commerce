package in.sp.main.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Seller;

public interface SellerRepository extends JpaRepository<Seller, Long> {
	Seller findByEmailAndPassword(String email, String password);
	Seller findByEmail(String Email);
	
}
