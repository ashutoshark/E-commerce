package in.sp.main.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Seller;
import in.sp.main.Repositories.SellerRepository;

//@Service
//public class SellerService {
//	
//	@Autowired 
//	private SellerRepository sellerRepository;
//	
//	public void registerSeller(Seller seller) {
//		sellerRepository.save(seller);
//	}
//	
//	public Seller authenticate(String email, String password) {
//		Seller seller = sellerRepository.findByEmail(email);
//		if (seller != null && seller.getPassword().equals(password)) {
//			return seller;
//		}
//		return null;
//	}
//	
//	public void updateSeller(Seller seller) {
//		sellerRepository.save(seller);
//	}
//
//}
 

@Service
public class SellerService {
	
	@Autowired 
	private SellerRepository sellerRepository;
	
	public void registerSeller(Seller seller) {
		sellerRepository.save(seller);
	}
	
	public Seller authenticate(String email, String password) {
		Seller seller = sellerRepository.findByEmail(email);
		if (seller != null && seller.getPassword().equals(password)) {
			return seller;
		}
		return null;
	}
	
	public Seller getSellerById(Long id) {
		return sellerRepository.findById(id).orElse(null);
	}
	
	 public void updateSeller(Seller seller) {
		sellerRepository.save(seller);
	}
	 
	public void deleteSeller(Long id) {
		sellerRepository.deleteById(id);
	}
	 
	public List<Seller> getAllSellers() {
	    return sellerRepository.findAll();
	}
}
