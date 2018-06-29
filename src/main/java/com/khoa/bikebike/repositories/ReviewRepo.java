package com.khoa.bikebike.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.khoa.bikebike.models.Review;

@Repository
public interface ReviewRepo extends CrudRepository<Review, Long> {
    
}
