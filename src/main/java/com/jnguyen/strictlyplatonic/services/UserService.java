package com.jnguyen.strictlyplatonic.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.jnguyen.strictlyplatonic.models.User;
import com.jnguyen.strictlyplatonic.repositories.UserRepo;

@Service
public class UserService {
	private final UserRepo userRepo;
	
	public UserService(UserRepo userRepo) {
		this.userRepo= userRepo;
	}
	// register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }

//find user by email
	public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    //update user
    public void updateUser(User user) {
        userRepo.save(user);
    }
    
    
// authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
// if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    //duplicate user
    public boolean duplicateUser(String email) {
        User user = userRepo.findByEmail(email);
        if(user == null) {
            return false;
        }
        else {
        	return true;
        }
    }
    
    public User createProfile(User user) {
    	return userRepo.save(user);
    }
   

    public List<User> allUsers(){
    	return (List<User>) userRepo.findAll();
    }
    
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}
//	//create testominals
//	public User createTestominal(User user) {
//		return userRepo.save(user);
//	}
////	
//	public List<User> getUser(){
//		return ()
//	}
}
