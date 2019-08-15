package com.david.JobTracker.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.david.JobTracker.models.User;
import com.david.JobTracker.repositories.UserRepository;

@Service
public class UserService {
	
	private UserRepository uR;
	
	public UserService(UserRepository uR) {
		this.uR = uR;
	}

	
	public User create(User user) {
		return uR.save(user);
		}
	
	public ArrayList<User> findAll(){
		return (ArrayList<User>) uR.findAll();
		}
	
	public User findById(Long user) {
		return uR.findById(user).get();
		}
	
	
	public User findByEmail(String email) {
		return uR.findByEmail(email);
		}
	
	
	public User update(User x) {
		return uR.save(x);
		}
	
	public void destroy(Long id) {
		uR.deleteById(id);
		}

}
