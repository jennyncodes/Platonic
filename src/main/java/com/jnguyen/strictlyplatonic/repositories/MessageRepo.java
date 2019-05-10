package com.jnguyen.strictlyplatonic.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jnguyen.strictlyplatonic.models.Message;

@Repository
public interface MessageRepo extends CrudRepository<Message, Long>{
	

}
