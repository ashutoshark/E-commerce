package in.sp.main.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Review;
import in.sp.main.Repositories.ReviewRepository;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    // Save review
    public void saveReview(Review review) {
        reviewRepository.save(review);
    }

    // Get all reviews (old method)
    public List<Review> getReviewsByProduct(Long productId) {
        return reviewRepository.findByProductId(productId);
    }

    // ⭐ Average Rating
    public Double getAverageRating(Long productId) {
        Double avg = reviewRepository.findAverageRatingByProductId(productId);
        return avg != null ? avg : 0.0;
    }

    // 📝 Latest Reviews
    public List<Review> getLatestReviews(Long productId) {
        return reviewRepository.findTop5ByProductIdOrderByReviewDateDesc(productId);
    }
}