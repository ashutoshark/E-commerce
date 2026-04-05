	package in.sp.main.Repositories;
	
	import org.springframework.data.jpa.repository.JpaRepository;
	import org.springframework.stereotype.Repository;
	import in.sp.main.Entities.OrderItem;
	
	@Repository
	public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
	}
