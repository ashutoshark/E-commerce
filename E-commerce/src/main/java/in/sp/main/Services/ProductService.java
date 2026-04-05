package in.sp.main.Services;

import in.sp.main.Entities.Product;
import in.sp.main.Repositories.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepo;

    public List<Product> getAllProducts() {
        return productRepo.findAll();
    }

    public Product getProductById(Long id) {
        return productRepo.findById(id).orElse(null);
    }

    public void saveProduct(Product product) {
        productRepo.save(product);
    }

    public void updateProduct(Product product) {
        productRepo.save(product);
    }

    public void deleteProduct(Long id) {
        productRepo.deleteById(id);
    }

    public List<Product> searchProductsByName(String keyword) {
        return productRepo.findByNameContainingIgnoreCase(keyword);
    }
    
    public List<Product> getProductsBySeller(Long sellerId) {
		return productRepo.findBySellerId(sellerId);
	}

	public Object searchProductsByNameAndSeller(String keyword, Long id) {
		
		 return productRepo.findByNameContainingIgnoreCaseAndSellerId(keyword, id);
	}
	//getting all products which is listed by the seller and approved by admin
	public List<Product> getPendingProducts() {
		return productRepo.findByApproved(false);
	}
	
	public List<Product> getApprovedProducts() {
		return productRepo.findByApproved(true);
	}
	
	
	public void approveProduct(Long id) {
		Product product = getProductById(id);
		if (product != null) {
			product.setApproved(true);
			product.setRejectionReason(null);
			productRepo.save(product);
		}
		
	}
	
	public void rejectProduct(Long id, String reason) {
		Product product = getProductById(id);
		if (product != null) {
			product.setApproved(false);
			product.setRejectionReason(reason);
			productRepo.save(product);
		}
		
	}
	public List<Product> searchApprovedProducts(String keyword) {
	    return productRepo.findByNameContainingIgnoreCaseAndApproved(keyword, true);
	}
	
	 
}
