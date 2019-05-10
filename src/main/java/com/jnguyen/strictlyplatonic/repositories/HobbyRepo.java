package com.jnguyen.strictlyplatonic.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jnguyen.strictlyplatonic.models.Hobby;
import com.jnguyen.strictlyplatonic.models.User;

@Repository
public interface HobbyRepo extends CrudRepository<Hobby, Long>{
	
	Optional<Hobby> findHobbyById(Long id);
	
	List<Hobby> findHobbyByUser(User user);
}
