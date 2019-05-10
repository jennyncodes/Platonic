package com.jnguyen.strictlyplatonic.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jnguyen.strictlyplatonic.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long>{
	
	User findByEmail(String email);

}
