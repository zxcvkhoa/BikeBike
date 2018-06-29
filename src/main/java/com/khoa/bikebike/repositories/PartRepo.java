package com.khoa.bikebike.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.khoa.bikebike.models.Part;

@Repository
public interface PartRepo extends CrudRepository<Part, Long> {
    Part findByName(String name);
    Part findByUser(Long userId);
}
