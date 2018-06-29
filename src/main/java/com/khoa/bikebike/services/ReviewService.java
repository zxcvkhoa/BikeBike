package com.khoa.bikebike.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.khoa.bikebike.models.Review;
import com.khoa.bikebike.repositories.ReviewRepo;

@Service
public class ReviewService {
    private final ReviewRepo reviewRepo;
    
    public ReviewService(ReviewRepo reviewRepo) {
        this.reviewRepo = reviewRepo;
    }
    	
	public Review createReview(Review review) {
		return reviewRepo.save(review);
	}
	
	public Review findReview(Long reviewId) {
		Optional<Review> optionalReview = reviewRepo.findById(reviewId);
		if(optionalReview.isPresent()) {
			return optionalReview.get();
		}else {
			return null;
		}
	}
	
	public List<Review> readAll(){
		return (List<Review>) reviewRepo.findAll();
	}

	public void update(Review review) {
		reviewRepo.save(review);
	}

}
