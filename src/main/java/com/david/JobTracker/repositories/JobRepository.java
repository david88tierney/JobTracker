package com.david.JobTracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.david.JobTracker.models.Job;

public interface JobRepository extends CrudRepository <Job, Long>{
	
	List<Job> findAll();

	Job findByTitle(String title);

}
