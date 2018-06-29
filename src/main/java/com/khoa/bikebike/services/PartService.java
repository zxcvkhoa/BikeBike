package com.khoa.bikebike.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.khoa.bikebike.models.Part;
import com.khoa.bikebike.repositories.PartRepo;

@Service
public class PartService {
private final PartRepo partRepo;
	
	public PartService(PartRepo partRepo) {
		this.partRepo = partRepo;
	}
	
	public Part createPart(Part part) {
		return partRepo.save(part);
	}
	
	public Part findPart(Long partId) {
		Optional<Part> optionalPart = partRepo.findById(partId);
		if(optionalPart.isPresent()) {
			return optionalPart.get();
		}else {
			return null;
		}
	}
	
	public List<Part> readAll(){
		return (List<Part>) partRepo.findAll();
	}

	public void update(Part part) {
		partRepo.save(part);
	}
	
	public void deletePart(long id) {
		partRepo.deleteById(id);
	}

}
