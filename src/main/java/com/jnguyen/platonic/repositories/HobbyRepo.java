package com.jnguyen.platonic.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jnguyen.platonic.models.Hobby;
import com.jnguyen.platonic.models.User;

@Repository
public interface HobbyRepo extends CrudRepository<Hobby, Long>{
	
	Optional<Hobby> findHobbyById(Long id);
	
	List<Hobby> findHobbyByUser(User user);
}
