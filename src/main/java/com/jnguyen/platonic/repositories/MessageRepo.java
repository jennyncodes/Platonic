package com.jnguyen.platonic.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jnguyen.platonic.models.Message;

@Repository
public interface MessageRepo extends CrudRepository<Message, Long>{
	

}
