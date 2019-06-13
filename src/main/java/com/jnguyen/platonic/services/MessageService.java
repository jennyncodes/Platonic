package com.jnguyen.platonic.services;

import org.springframework.stereotype.Service;

import com.jnguyen.platonic.models.Message;
import com.jnguyen.platonic.repositories.MessageRepo;

@Service
public class MessageService {
	private final MessageRepo messageRepo;
	
	public MessageService(MessageRepo messageRepo) {
		this.messageRepo= messageRepo;
	}
	public Message addMessage(Message message) {
		return messageRepo.save(message);
	}
	public void updateMessage(Message message) {
    	messageRepo.save(message);
    }
    
    public void newMessage(Message message) {
        messageRepo.save(message);
    }

}
