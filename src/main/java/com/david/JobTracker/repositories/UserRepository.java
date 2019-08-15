package com.david.JobTracker.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.david.JobTracker.models.User;

public interface UserRepository extends CrudRepository<User, Long>{
	User findByEmail(String email);
	Optional<User> findById(Long id);
}
