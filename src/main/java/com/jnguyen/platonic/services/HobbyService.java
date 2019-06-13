package com.jnguyen.platonic.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jnguyen.platonic.models.Hobby;
import com.jnguyen.platonic.models.User;
import com.jnguyen.platonic.repositories.HobbyRepo;

@Service
public class HobbyService {
	private final HobbyRepo hobbyRepo;
	
	public HobbyService(HobbyRepo hobbyRepo) {
		this.hobbyRepo= hobbyRepo;
	}
	public Hobby createHobby(Hobby hobby) {
		return hobbyRepo.save(hobby);
	}
	public void updateHobby(Hobby hobby) {
		hobbyRepo.save(hobby);
		
	}
	public Hobby findHobbyById(Long id) {
		Optional<Hobby> optionalHobby= hobbyRepo.findHobbyById(id);
		if(optionalHobby.isPresent()) {
			return optionalHobby.get();
		}
		else {
			return null;
		}
	}
	public List<Hobby> findHobbyByUser(User user) {
		return hobbyRepo.findHobbyByUser(user);
		
	}
	
	public void deleteHobby(Long id) {
		hobbyRepo.deleteById(id);
	}

    public List<Hobby> allHobbies(){
    	return (List<Hobby>) hobbyRepo.findAll();
    }

}
